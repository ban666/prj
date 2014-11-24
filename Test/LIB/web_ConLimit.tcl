#!/bin/sh
# webpy.tcl \
exec tclsh "$0" ${1+"$@"}

#ͨ��python�ű�ssh��½���豸��ִ������
namespace eval web_DestIPControl {
}



#--------------------------
#���ܣ���ȡ�����б�
#--------------------------
proc GetConlimitList {{page 1} {rows 20} } {
	set Result [HttpPost GetConlimitList page:$page,rows:$rows]
	return $Result
}



#--------------------------
#���ܣ��������
#--------------------------
proc AddConlimit {args} {
	array set list {clname "Autotest"\
			connum ""\
			conrate ""\
			usertype ""\
			timeid ""\
			userids ""\
			segments ""\
			}
		if {[regexp  {{(.*)}} $args wholes list2 ]} {
			 foreach {i j} $list2 {
				 set list($i) $j
			 }
			}	
			foreach {i j} $args {
					set list($i) $j
				}
	
	
	if {[string equal $list(usertype) "seg"]} {
			
		set AddRet [HttpPost AddConlimit clname:$list(clname),connum:$list(connum),conrate:$list(conrate),timeid:$list(timeid),usertype:$list(usertype),segments:$list(segments)]
		} elseif {[string equal $list(usertype) "ip"]} {
			
		set AddRet [HttpPost AddConlimit clname:$list(clname),connum:$list(connum),conrate:$list(conrate),timeid:$list(timeid),usertype:$list(usertype),userids:$list(userids)]	
		} else {
			
		set AddRet [HttpPost AddConlimit clname:$list(clname),connum:$list(connum),conrate:$list(conrate),timeid:$list(timeid),usertype:$list(usertype)]	
		}	
	
	set Ret [CheckResult $AddRet]
	set id  [GetConlimitListIdByName $list(clname)]
	set RetId [lreplace $Ret 2 2 $id]
	return $RetId
	}


#--------------------------
#���ܣ�ɾ������
#--------------------------
proc DeleteConlimitsById {id } {
set Result [HttpPost DeleteConlimits clids:$id]
set Ret [CheckResult $Result]
		return $Ret
}

#--------------------------
#���ܣ���ȡʱ����ID
#--------------------------
proc GetConlimitListIdByName {name {page 1} {rows 20}} {
	set id ""
	set Info [GetConlimitList $page $rows]
	set temp [split $Info ,]
	for {set x 0} {$x<[llength $temp]} {incr x} {
		if {[regexp $name [lindex $temp $x]]} {
			set id [lindex [split [lindex $temp [expr $x-1]] :] end]
			regsub -all \" $id "" id 
			
			break
		}
	}
	return $id
}



#--------------------------
#���ܣ��༭����
#--------------------------
proc UpdateConlimit {args} {
	array set list {clid ""\
                        clname "Autotest"\
			connum ""\
			conrate ""\
			usertype ""\
			timeid ""\
			userids ""\
			segments ""\
			}
		if {[regexp  {{(.*)}} $args wholes list2 ]} {
			 foreach {i j} $list2 {
				 set list($i) $j
			 }
			}	
			foreach {i j} $args {
					set list($i) $j
				}
	
	
	if {[string equal $list(usertype) "seg"]} {
			
		set AddRet [HttpPost UpdateConlimit clid:$list(clid),clname:$list(clname),connum:$list(connum),conrate:$list(conrate),timeid:$list(timeid),usertype:$list(usertype),segments:$list(segments)]
		} elseif {[string equal $list(usertype) "ip"]} {
			
		set AddRet [HttpPost UpdateConlimit clid:$list(clid),clname:$list(clname),connum:$list(connum),conrate:$list(conrate),timeid:$list(timeid),usertype:$list(usertype),userids:$list(userids)]	
		} else {
			
		set AddRet [HttpPost UpdateConlimit clid:$list(clid),clname:$list(clname),connum:$list(connum),conrate:$list(conrate),timeid:$list(timeid),usertype:$list(usertype)]	
		}	
	
	set Ret [CheckResult $AddRet]
	set id  [GetConlimitListIdByName $list(clname)]
	set RetId [lreplace $Ret 2 2 $id]
	return $RetId
	}



