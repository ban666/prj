#!/bin/sh
# TimeGroup.tcl \
exec tclsh "$0" ${1+"$@"}
proc TimeAdd {args} {
array set list {timename "Autotest"\
		timedesc "Autotest"\
		t1 "08:00:00"\
		f1 "12:00:00"\
		t2 "14:00:00"\
		f2 "18:00:00"\
}
if {[regexp  {{(.*)}} $args wholes list2 ]} {
		 foreach {i j} $list2 {
			 set list($i) $j
		 }
		}	
		foreach {i j} $args {
				set list($i) $j
			}
	cd "$::g_python\\TimeGroup\\"
set file "$::g_python\\TimeGroup\\TimeAdd.py"
if	{[catch {set a [exec python.exe $file $list(timename) $list(timedesc) $list(t1) $list(f1) $list(t2) $list(f2)]} msg]} {
	puts "���ʱ����ʧ��"
		   return [list 0 $msg {}]
	       } 
	if {[regexp "TimeGroup Add Success" $a]} {
	     puts "���ʱ����ɹ�"
		return [list 1 {} {}]
		} else {
			puts "���ʱ����ʧ��"
			return [list 0 {} {}]	
		}
}


proc TimeEdit {args} {
array set list {timename "Autotest"\
		timedesc "Autotest"\
		t1 "08:00:00"\
		f1 "12:00:00"\
		t2 "14:00:00"\
		f2 "18:00:00"\
}
if {[regexp  {{(.*)}} $args wholes list2 ]} {
		 foreach {i j} $list2 {
			 set list($i) $j
		 }
		}	
		foreach {i j} $args {
				set list($i) $j
			}
	cd "$::g_python\\TimeGroup\\"
set file "$::g_python\\TimeGroup\\TimeEdit.py"
if	{[catch {set a [exec python.exe $file $list(timename) $list(timedesc) $list(t1) $list(f1) $list(t2) $list(f2)]} msg]} {
	puts "�༭ʱ����ʧ��"
		   return [list 0 $msg {}]
	       } 
	if {[regexp "TimeGroup Edit Success" $a]} {
	     puts "�༭ʱ����ɹ�"
		return [list 1 {} {}]
		} else {
			puts "�༭ʱ����ʧ��"
			return [list 0 {} {}]	
		}
}

proc TimeDel {} {
	cd "$::g_python\\TimeGroup\\"
	set file "$::g_python\\TimeGroup\\TimeDel.py"
	if	{[catch {set a [exec python.exe $file]} msg]} {
		puts "ɾ��ʱ����ʧ��"
			   return [list 0 $msg {}]
		       } 
		if {[regexp "TimeGroup Delete Success" $a]} {
		     puts "ɾ��ʱ����ɹ�"
			return [list 1 {} {}]
			} else {
				puts "ɾ��ʱ����ʧ��"
				return [list 0 {} {}]	
			}
	}

proc ClearTimeconfig {} {
	set status 1
	while {[lindex $status 0]!=0} {
		set status [TimeDel]
	}
	return [1 {} {}]
}
