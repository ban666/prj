#!/bin/sh
# webpy.tcl \
exec tclsh "$0" ${1+"$@"}

#通过python脚本ssh登陆到设备并执行命令
namespace eval web_DestIPControl {
}



#--------------------------
#功能：获取子网列表
#--------------------------
proc GetDestIPControlList {{page 1} {rows 20} } {
	set file "$::g_web_python\\HttpPost.py"
	set Result [HttpPost GetDestIPControlList page:$page,rows:$rows]
	return $Result
}

proc FlushDestIPControl {{page 1} {rows 20} } {
	set file "$::g_web_python\\HttpPost.py"
	set Result [HttpPost FlushDestIPControl page:$page,rows:$rows]
	return $Result
}

#--------------------------
#功能：添加子网
#--------------------------
proc AddDestIPControl {args} {
	array set list {ip "Autotest"\
			usertype "subnet"\
			userids ""\
			segments ""\
			timeid ""\
			enable ""\
			}
		if {[regexp  {{(.*)}} $args wholes list2 ]} {
			 foreach {i j} $list2 {
				 set list($i) $j
			 }
			}	
			foreach {i j} $args {
					set list($i) $j
				}
	
	
	if {[string equal $list(usertype) "ip"]} {
			
		set AddRet [HttpPost AddDestIPControl ip:$list(ip),usertype:$list(usertype),userids:$list(userids),timeid:$list(timeid),enable:$list(enable)]
		} elseif {[string equal $list(usertype) "seg"]} {
			
		set AddRet [HttpPost AddDestIPControl ip:$list(ip),usertype:$list(usertype),segments:$list(segments),timeid:$list(timeid),enable:$list(enable)]
			
		} else {
			
		set AddRet [HttpPost AddDestIPControl ip:$list(ip),usertype:$list(usertype),timeid:$list(timeid),enable:$list(enable)]
			
		}	
	
	set Ret [CheckResult $AddRet]
	set id  [GetDestIPControlIdByIP $list(ip)]
	set RetId [lreplace $Ret 2 2 $id]
	return $RetId
	}


#--------------------------
#功能：删除子网
#--------------------------
proc DeleteDestIPControlById {id } {
set Result [HttpPost DeleteDestIPControl id:$id]
set Ret [CheckResult $Result]
	return $Ret
}

#--------------------------
#功能：获取时间组ID
#--------------------------
proc GetDestIPControlIdByIP {ip {page 1} {rows 20}} {
	set id ""
	set Info [GetDestIPControlList $page $rows]
	set temp [split $Info ,]
	for {set x 0} {$x<[llength $temp]} {incr x} {
		if {[regexp $ip [lindex $temp $x]]} {
			set id [lindex [split [lindex $temp [expr $x-1]] :] end]
			regsub -all \" $id "" id 
			
			break
		}
	}
	return $id
}



#--------------------------
#功能：编辑子网
#--------------------------
proc UpdateDestIPControl {args} {
	array set list {id ""\
                        ip "Autotest"\
			usertype "subnet"\
			userids ""\
			segments ""\
			timeid ""\
			enable ""\
			}
		if {[regexp  {{(.*)}} $args wholes list2 ]} {
			 foreach {i j} $list2 {
				 set list($i) $j
			 }
			}	
			foreach {i j} $args {
					set list($i) $j
				}
	
	
	if {[string equal $list(usertype) "ip"]} {
			
		set AddRet [HttpPost UpdateDestIPControl id:$list(id),ip:$list(ip),usertype:$list(usertype),userids:$list(userids),timeid:$list(timeid),enable:$list(enable)]
		} elseif {[string equal $list(usertype) "seg"]} {
			
		set AddRet [HttpPost UpdateDestIPControl id:$list(id),ip:$list(ip),usertype:$list(usertype),segments:$list(segments),timeid:$list(timeid),enable:$list(enable)]
			
		} else {
			
		set AddRet [HttpPost UpdateDestIPControl id:$list(id),ip:$list(ip),usertype:$list(usertype),timeid:$list(timeid),enable:$list(enable)]
			
		}	
	
	set Ret [CheckResult $AddRet]
	set id  [GetDestIPControlIdByIP $list(ip)]
	set RetId [lreplace $Ret 2 2 $id]
	return $RetId
	}


