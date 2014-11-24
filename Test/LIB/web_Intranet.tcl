#!/bin/sh
# webpy.tcl \
exec tclsh "$0" ${1+"$@"}

#ͨ��python�ű�ssh��½���豸��ִ������
namespace eval web_Intranet {
}



#--------------------------
#���ܣ���ȡ�����б�
#--------------------------
proc GetIntranetList {{page 1} {rows 20} } {
	set file "$::g_web_python\\HttpPost.py"
	set Result [HttpPost GetIntranetList page:$page,rows:$rows]
	return $Result
}

#--------------------------
#���ܣ��������
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
#���ܣ�ɾ������
#--------------------------
proc DeleteIntranetByid {id } {
set Result [HttpPost DeleteIntranet id:$id]
set Ret [CheckResult $Result]
	return $Ret
}

#--------------------------
#���ܣ���ȡʱ����ID
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
				ShowMessage "--------ɾ�� $id ������ʧ��--------"
			}
		}
	}
	return [list $status $Flist {}]
}

#--------------------------
#���ܣ��༭����
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


