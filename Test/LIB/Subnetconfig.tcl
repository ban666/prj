#!/bin/sh
# TimeGroup.tcl \
exec tclsh "$0" ${1+"$@"}
proc SubnetAdd {args} {
array set list {ip "192.168.100.0"\
		mask "255.255.255.0"\
}
if {[regexp  {{(.*)}} $args wholes list2 ]} {
		 foreach {i j} $list2 {
			 set list($i) $j
		 }
		}	
		foreach {i j} $args {
				set list($i) $j
			}
	cd "$::g_python\\Subnet\\"
set file "$::g_python\\Subnet\\SubnetAdd.py"
if	{[catch {set a [exec python.exe $file $list(ip) $list(mask)]} msg]} {
	puts "�������ʧ��"
		   return [list 0 $msg {}]
	       } 
	if {[regexp "Subnet Add Success" $a]} {
	     puts "��������ɹ�"
		return [list 1 {} {}]
		} else {
			puts "�������ʧ��"
			return [list 0 {} {}]	
		}
}



proc SubnetDel {} {
	cd "$::g_python\\Subnet\\"
	set file "$::g_python\\Subnet\\SubnetDel.py"
	if	{[catch {set a [exec python.exe $file]} msg]} {
		puts "ɾ������ʧ��"
			   return [list 0 $msg {}]
		       } 
		if {[regexp "Subnet Del Success" $a]} {
		     puts "ɾ�������ɹ�"
			return [list 1 {} {}]
			} else {
				puts "ɾ������ʧ��"
				return [list 0 {} {}]	
			}
	}

proc ClearSubnetconfig {} {
	set status 1
	while {[lindex $status 0]!=0} {
		set status [SubnetDel]
	}
	return [1 {} {}]
}
