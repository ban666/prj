#!/bin/sh
# webpy.tcl \
exec tclsh "$0" ${1+"$@"}

#通过python脚本ssh登陆到设备并执行命令
namespace eval web_Intranet {
}



#--------------------------
#功能：获取子网列表
#--------------------------
proc GetIntranetList {{page 1} {rows 20} } {
	set file "$::g_web_python\\HttpPost.py"
	set Result [HttpPost GetIntranetList page:$page,rows:$rows]
	return $Result
}

#--------------------------
#功能：添加子网
#--------------------------
proc AddIntranet {args} {
	array set list {netName "Autotest"\
	                netType "subnet"\
			subnet ""\
			mask ""\
			startAddr ""\
			endAddr ""\
			excludeList ""
			}
		if {[regexp  {{(.*)}} $args wholes list2 ]} {
			 foreach {i j} $list2 {
				 set list($i) $j
			 }
			}	
			foreach {i j} $args {
					set list($i) $j
				}
	
	if {[string equal $list(netType) "subnet"]} {
		
	set AddRet [HttpPost AddIntranet netName:$list(netName),netType:$list(netType),subnet:$list(subnet),mask:$list(mask),excludeList:$list(excludeList)]
	} elseif {[string equal $list(netType) "range"]} {
		
	set AddRet [HttpPost AddIntranet netName:$list(netName),netType:$list(netType),startAddr:$list(startAddr),endAddr:$list(endAddr),excludeList:$list(excludeList)]
	} else {
		
	set AddRet [HttpPost AddIntranet netName:$list(netName),netType:$list(netType),startAddr:$list(startAddr),endAddr:$list(endAddr),excludeList:$list(excludeList)]
	}	
		
	set Ret [CheckResult $AddRet]
	set id  [GetIntranetIdByname $list(netName)]
	set RetId [lreplace $Ret 2 2 $id]
	return $RetId
	}


#--------------------------
#功能：删除子网
#--------------------------
proc DeleteIntranetByid {id } {
set Result [HttpPost DeleteIntranet id:$id]
set Ret [CheckResult $Result]
	return $Ret
}

#--------------------------
#功能：获取时间组ID
#--------------------------
proc GetIntranetIdByname {name {page 1} {rows 20}} {
	set id ""
	set Info [GetIntranetList $page $rows]
	set temp [split $Info ,]
	for {set x 0} {$x<[llength $temp]} {incr x} {
		if {[regexp $name [lindex $temp $x]]} {
			set id [lindex [split [lindex $temp [expr $x-2]] :] end]
			regsub -all \" $id "" id 
			
			break
		}
	}
	return $id
}


proc ClearIntranet {{page 1} {rows 20}} {
	set id ""
	set Flist ""
	set status 1
	set Info [GetIntranetList $page $rows]
	set temp [split $Info ,]
	for {set x 0} {$x<[llength $temp]} {incr x} {
		if {[regexp "netName" [lindex $temp $x]]} {
			set id [lindex [split [lindex $temp [expr $x-2]] :] end]
			regsub -all \" $id "" id 
			set DelRet [DeleteIntranetByid $id]
			if {[lindex $DelRet 0]!=1} {
				set status 0
				lappend Flist $id
				ShowMessage "--------删除 $id 号子网失败--------"
			}
		}
	}
	return [list $status $Flist {}]
}

#--------------------------
#功能：编辑子网
#--------------------------
proc UpdateIntranet {args} {
	array set list {id ""
                        netName "autotest"\
			netType "subnet"\
			subnet ""\
			mask ""\
			startAddr ""\
			endAddr ""\
			excludeList ""
			}
		if {[regexp  {{(.*)}} $args wholes list2 ]} {
			 foreach {i j} $list2 {
				 set list($i) $j
			 }
			}	
			foreach {i j} $args {
					set list($i) $j
				}
	
	if {[string equal $list(netType) "subnet"]} {
		
	set AddRet [HttpPost UpdateIntranet id:$list(id),netName:$list(netName),netType:$list(netType),subnet:$list(subnet),mask:$list(mask),excludeList:$list(excludeList)]
	} elseif {[string equal $list(netType) "range"]} {
		
	set AddRet [HttpPost UpdateIntranet id:$list(id),netName:$list(netName),netType:$list(netType),startAddr:$list(startAddr),endAddr:$list(endAddr),excludeList:$list(excludeList)]
	} else {
		
	set AddRet [HttpPost UpdateIntranet id:$list(id),netName:$list(netName),netType:$list(netType),startAddr:$list(startAddr),endAddr:$list(endAddr),excludeList:$list(excludeList)]
	}	
		
	set Ret [CheckResult $AddRet]
	return $Ret
	}


