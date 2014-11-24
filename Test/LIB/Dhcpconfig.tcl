#!/bin/sh
# DHCP.tcl \
exec tclsh "$0" ${1+"$@"}
proc DhcpAdd {args} {
array set list {segment "192.168.2.0"\
		mask "255.255.255.0"\
		startip "192.168.2.2"\
		endip "192.168.2.254"\
}
if {[regexp  {{(.*)}} $args wholes list2 ]} {
		 foreach {i j} $list2 {
			 set list($i) $j
		 }
		}	
		foreach {i j} $args {
				set list($i) $j
			}
	cd "$::g_python\\DHCPConfig"
set file "$::g_python\\DHCPConfig\\DhcpAdd.py"
if	{[catch {set a [exec python.exe $file $list(segment) $list(mask) $list(startip) $list(endip)]} msg]} {
	puts "���DHCPʧ��"
	puts $msg
		   return [list 0 $msg {}]
	       } 
	if {[regexp "Dhcp Add Success" $a]} {
	     puts "���DHCP�ɹ�"
		return [list 1 {} {}]
		} else {
			puts "���DHCPʧ��"
			return [list 0 {} {}]	
		}
}


proc DhcpEdit {args} {
array set list {segment "192.168.2.0"\
		mask "255.255.255.0"\
		startip "192.168.2.2"\
		endip "192.168.2.254"\
}
if {[regexp  {{(.*)}} $args wholes list2 ]} {
		 foreach {i j} $list2 {
			 set list($i) $j
		 }
		}	
		foreach {i j} $args {
				set list($i) $j
			}
	cd "$::g_python\\DHCPConfig"
set file "$::g_python\\\DHCPConfig\\DhcpEdit.py"
if	{[catch {set a [exec python.exe $file $list(segment) $list(mask) $list(startip) $list(endip)]} msg]} {
	puts "�༭DHCPʧ��"
		   return [list 0 $msg {}]
	       } 
	if {[regexp "Dhcp Edit Success" $a]} {
	     puts "�༭DHCP�ɹ�"
		return [list 1 {} {}]
		} else {
			puts "�༭DHCPʧ��"
			return [list 0 {} {}]	
		}
}

proc DhcpDel {} {
	cd "$::g_python\\DHCPConfig"
	set file "$::g_python\\\DHCPConfig\\DhcpDel.py"
	if	{[catch {set a [exec python.exe $file]} msg]} {
		puts "ɾ��DHCPʧ��"
			   return [list 0 $msg {}]
		       } 
		if {[regexp "Dhcp Delete Success" $a]} {
		     puts "ɾ��DHCP�ɹ�"
			return [list 1 {} {}]
			} else {
				puts "ɾ��DHCPʧ��"
				return [list 0 {} {}]	
			}
	}

proc ClearDhcpconfig {} {
	set status 1
	while {[lindex $status 0]!=0} {
		set status [DhcpDel]
	}
	return [1 {} {}]
}
