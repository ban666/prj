#!/bin/sh
# webpy.tcl \
exec tclsh "$0" ${1+"$@"}

#ͨ��python�ű�ssh��½���豸��ִ������
namespace eval web_Time {
}



#--------------------------
#���ܣ���ȡʱ����ID
#--------------------------
proc GetTimeId {timename} {
	set id ""
	set content [GetTimeList]
	set temp [split $content ,]
	set info "\"timename\"\:\"$timename\""
for {set x 0} {$x<[llength $temp]} {incr x} {
	if {[regexp $info [lindex $temp $x]]} {
		set id [lindex [split [lindex $temp [expr $x-1]] :] end]
		break
	}
}	
	return $id
}

#--------------------------
#���ܣ���ȡ����ʱ����ID
#--------------------------
proc GetAllTimeId {} {
	set id ""
	set list ""
	set content [GetTimeList]
	set temp [split $content ,]
 foreach arg $temp {
	 if {[regexp timeid $arg]} {
		 lappend list [lindex [split $arg :] end]
		 
	 }
 }
	return $list
}

#--------------------------
#���ܣ���ȡʱ����
#--------------------------
proc GetTimeList {{page 1} {rows 20} } {
set Result [HttpPost GetTimeList page:$page,rows:$rows]
	return $Result
}

#--------------------------
#���ܣ����ʱ����
#--------------------------
proc AddTimeList {args} {
array set list {timename "Autotest"\
		timedesc "Autotest"\
		    week "Mon@Tue@Wed@Thu@Fri"\
		  from1 "08:00:00"\
		  to1 "12:00:00"\
		  from2 "14:00:00"\
		  to2 "18:00:00"}
	if {[regexp  {{(.*)}} $args wholes list2 ]} {
		 foreach {i j} $list2 {
			 set list($i) $j
		 }
		}	
		foreach {i j} $args {
				set list($i) $j
			}

set AddRet [HttpPost AddTime timename:$list(timename),timedesc:$list(timedesc),week:$list(week),from1:$list(from1),to1:$list(to1),from2:$list(from2),to2:$list(to2)]
set Ret [CheckResult $AddRet]
set id	[GetTimeId $list(timename)]
	puts $id
set RetId [lreplace $Ret 2 2 $id]
return $RetId
}

#--------------------------
#���ܣ��༭ʱ����
#--------------------------
proc UpdateTimeList {args} {
array set list {id ""\
                timename "Autotest"\
		timedesc "Autotest"\
		    week "Mon@Tue@Wed@Thu@Fri"\
		  from1 "08:00:00"\
		  to1 "12:00:00"\
		  from2 "14:00:00"\
		  to2 "18:00:00"}
	if {[regexp  {{(.*)}} $args wholes list2 ]} {
		 foreach {i j} $list2 {
			 set list($i) $j
		 }
		}	
		foreach {i j} $args {
				set list($i) $j
			}

set AddRet [HttpPost UpdateTime timeid:$list(id),timename:$list(timename),timedesc:$list(timedesc),week:$list(week),from1:$list(from1),to1:$list(to1),from2:$list(from2),to2:$list(to2)]
set Ret [CheckResult $AddRet]
return $Ret
}


#--------------------------
#���ܣ�ɾ��ʱ����
#--------------------------
proc DeleteTimeByname {content name } {
set id [GetTimeId $content $name]
set Result [HttpPost DeleteTime timeid:$id]
set Ret [CheckResult $result]
	return $Ret
}

#--------------------------
#���ܣ�ɾ��ʱ����
#--------------------------
proc DeleteTimeByid {id } {
set Result [HttpPost DeleteTime timeid:$id]
set Ret [CheckResult $Result]
	return $Ret
}

#--------------------------
#���ܣ����ʱ����
#--------------------------
proc ClearTime {} {
set status 0
#set GetTimeRet [GetTimeList ]
set GetAllIdRet [GetAllTimeId ]
set List [lrange $GetAllIdRet 1 end]
set Flist ""
foreach id $List {
	set flag [lindex [DeleteTimeByid $id] 0]
	if {$flag!=1} {
		puts "ɾ��$id��ʱ����ʧ��"
		set status [expr 1&&$flag]
		lappend Flist $id
        }
	
        }
	return [list $status $Flist {}]
}

