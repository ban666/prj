#!/bin/sh
# webpy.tcl \
exec tclsh "$0" ${1+"$@"}

#通过python脚本ssh登陆到设备并执行命令
namespace eval web_User {
}



#--------------------------
#功能：获取端口协议封堵列表
#--------------------------
proc GetPortProtocolList {{page 1} {rows 20} } {
	set file "$::g_web_python\\HttpPost.py"
	set Result [HttpPost GetPortProtocolList page:$page,rows:$rows]
	return $Result
}

#--------------------------
#功能：添加端口协议封堵
#--------------------------
proc AddPortProtocol {ppdesc porttype ports usertype timeid args} {
	array set list {userids ""\
		segments ""
	}
	if {[regexp  {{(.*)}} $args wholes list2 ]} {
				 foreach {i j} $list2 {
					 set list($i) $j
				 }
				}	
				foreach {i j} $args {
						set list($i) $j
					}
		
	if {[string equal $usertype "ip"]} {
			
		set AddRet [HttpPost AddPortProtocol ppdesc:$ppdesc,porttype:$porttype,ports:$ports,usertype:$usertype,userids:$list(userids),timeid:$timeid]
		} elseif {[string equal $usertype "seg"]} {
			'
		set AddRet [HttpPost AddPortProtocol ppdesc:$ppdesc,porttype:$porttype,ports:$ports,usertype:$usertype,segments:$list(segments),timeid:$timeid]
		} elseif {[string equal $usertype "all"]} {
			
		set AddRet [HttpPost AddPortProtocol ppdesc:$ppdesc,porttype:$porttype,ports:$ports,usertype:$usertype,timeid:$timeid]	
                }	
		set Ret [CheckResult $AddRet]
		return $Ret
	}

proc UpdatePortProtocol {ppid ppdesc porttype ports usertype timeid args} {
	array set list {userids ""\
		segments ""
	}
	if {[regexp  {{(.*)}} $args wholes list2 ]} {
				 foreach {i j} $list2 {
					 set list($i) $j
				 }
				}	
				foreach {i j} $args {
						set list($i) $j
					}
		
	if {[string equal $usertype "ip"]} {
			
		set AddRet [HttpPost UpdatePortProtocol ppid:$ppid,ppdesc:$ppdesc,porttype:$porttype,ports:$ports,usertype:$usertype,userids:$list(userids),timeid:$timeid]
		} elseif {[string equal $usertype "seg"]} {
			'
		set AddRet [HttpPost UpdatePortProtocol ppid:$ppid,ppdesc:$ppdesc,porttype:$porttype,ports:$ports,usertype:$usertype,segments:$list(segments),timeid:$timeid]
		} elseif {[string equal $usertype "all"]} {
			
		set AddRet [HttpPost UpdatePortProtocol ppid:$ppid,ppdesc:$ppdesc,porttype:$porttype,ports:$ports,usertype:$usertype,timeid:$timeid]	
		}	
		set Ret [CheckResult $AddRet]
		return $Ret
	}

proc GetProtocolIdByname {name {page 1} {rows 20}} {
	set id ""
	set Info [GetPortProtocolList $page $rows]
	set temp [split $Info ,]
	for {set x 0} {$x<[llength $temp]} {incr x} {
		if {[regexp $name [lindex $temp $x]]} {
			set id [lindex [split [lindex $temp [expr $x+1]] :] end]
			regsub -all \" $id "" id 
			
			break
		}
	}
	return $id
}

proc GetAllProtocolId {{page 1} {rows 20}} {
	set idlist ""
	set Info [GetPortProtocolList $page $rows]
	set temp [split $Info ,]
	for {set x 0} {$x<[llength $temp]} {incr x} {
		if {[regexp "\"ppid\"\:" [lindex $temp $x]]} {
			set id [lindex [split [lindex $temp $x] :] end]
			regsub -all \" $id "" id 
			lappend idlist $id
		}
	}
	return $idlist
}

proc DeletePortProtocol {ppid} {
	set file "$::g_web_python\\HttpPost.py"
	set Result [HttpPost DeletePortProtocol ppid:$ppid]
	set Ret [CheckResult $Result]
	return $Ret
}

proc ClearPortProtocol {} {
	set status 1
	set id [GetAllProtocolId]
	if {$id!=""} {
	foreach arg $id {
	set Result [CheckResult [HttpPost DeletePortProtocol ppid:$arg]]
	if {[lindex $Result 0]!=1} {
			set status 0
	}
	}
	}
	return $status
}