#!/bin/sh
# webpy.tcl \
exec tclsh "$0" ${1+"$@"}

#ͨ��python�ű�ssh��½���豸��ִ������
namespace eval web_AvoidTactics {
}



#--------------------------
#���ܣ���ȡ�����list
#--------------------------
proc GetAvoidTactics { {page 1} {rows 20} } {

set Result [HttpPost GetAvoidTactics page:$page,rows:$rows]
	return $Result
}

#--------------------------
#���ܣ���ȡ�����list
#--------------------------
proc AddAvoidTactics {args} {
	array set list {atname "Autotest"\
			usesel "subnet"\
			users ""\
			effectTime ""\
			tillTime ""\
			}
		if {[regexp  {{(.*)}} $args wholes list2 ]} {
			 foreach {i j} $list2 {
				 set list($i) $j
			 }
			}	
			foreach {i j} $args {
					set list($i) $j
				}
	
	
	set AddRet [HttpPost AddAvoidTactics atname:$list(atname),usesel:$list(usesel),users:$list(users),effectTime:$list(effectTime),tillTime:$list(tillTime)]
	
		
	set Ret [CheckResult $AddRet]
	set id  [GetAvoidTaticsId $list(atname)]
	set RetId [lreplace $Ret 2 2 $id]
	return $RetId
	}



#--------------------------
#���ܣ�ɾ�������
#--------------------------
proc DeleteAvoidTatics {id } {
set Result [HttpPost DeleteAvoidTatics ruleid:$id]
set Ret [CheckResult $Result]
	return $Ret
}


#--------------------------
#���ܣ���ȡ�����ID
#--------------------------
proc GetAvoidTaticsId {atname} {
	set id ""
	set info "\"atname\"\:\"$atname\""
	set content [GetAvoidTactics]
	set temp [split $content ,]
for {set x 0} {$x<[llength $temp]} {incr x} {
	if {[regexp $info [lindex $temp $x]]} {
		set id [lindex [split [lindex $temp [expr $x+2]] :] end]
		break
	}
}	
	return $id
}

#--------------------------
#���ܣ���ȡ�����list
#--------------------------
proc UpdateAvoidTactics {args} {
	array set list {ruleid ""\
                        atname "Autotest"\
			usesel "subnet"\
			users ""\
			effectTime ""\
			tillTime ""\
			}
		if {[regexp  {{(.*)}} $args wholes list2 ]} {
			 foreach {i j} $list2 {
				 set list($i) $j
			 }
			}	
			foreach {i j} $args {
					set list($i) $j
				}
	
	
	set AddRet [HttpPost UpdateAvoidTactics ruleid:$list(ruleid),atname:$list(atname),usesel:$list(usesel),users:$list(users),effectTime:$list(effectTime),tillTime:$list(tillTime)]
	
		
	set Ret [CheckResult $AddRet]
	return $Ret
	}



