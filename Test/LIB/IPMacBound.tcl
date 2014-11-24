#!/bin/sh
# IP_MAC bound.tcl \
exec tclsh "$0" ${1+"$@"}
proc IPMacAdd {args} {
array set list {ip "1.1.1.1"\
		mac "aa:bb:cc:dd:ee:11"\
}
if {[regexp  {{(.*)}} $args wholes list2 ]} {
		 foreach {i j} $list2 {
			 set list($i) $j
		 }
		}	
		foreach {i j} $args {
				set list($i) $j
			}
	cd "$::g_python\\IPMac"
set file "$::g_python\\IPMac\\IPMacAdd.py"
if	{[catch {set a [exec python.exe $file $list(ip) $list(mac)]} msg]} {
	puts "���IP_MACʧ��"
	puts $msg
		   return [list 0 $msg {}]
	       } 
	if {[regexp "IP_Mac Add Success" $a]} {
	     puts "���IP_MAC�ɹ�"
		return [list 1 {} {}]
		} else {
			puts "���IP_MACʧ��"
			return [list 0 {} {}]	
		}
}


proc IPMacEdit {args} {
array set list {ip "1.1.1.1"\
		mac "aa:bb:cc:dd:ee:11"\
}
if {[regexp  {{(.*)}} $args wholes list2 ]} {
		 foreach {i j} $list2 {
			 set list($i) $j
		 }
		}	
		foreach {i j} $args {
				set list($i) $j
			}
			cd "$::g_python\\IPMac"
			set file "$::g_python\\IPMac\\IPMacEdit.py"
if	{[catch {set a [exec python.exe $file $list(ip) $list(mac)]} msg]} {
	puts "�༭IP_MACʧ��"
		   return [list 0 $msg {}]
	       } 
	if {[regexp "IP_Mac Edit Success" $a]} {
	     puts "�༭IP_MAC�ɹ�"
		return [list 1 {} {}]
		} else {
			puts "�༭IP_MACʧ��"
			return [list 0 {} {}]	
		}
}

proc IPMacDel {} {
			cd "$::g_python\\IPMac"
			set file "$::g_python\\IPMac\\IPMacDel.py"
	if	{[catch {set a [exec python.exe $file]} msg]} {
		puts "ɾ��IP_MACʧ��"
			   return [list 0 $msg {}]
		       } 
		if {[regexp "IP_Mac Del Success" $a]} {
		     puts "ɾ��IP_MAC�ɹ�"
			return [list 1 {} {}]
			} else {
				puts "ɾ��IP_MACʧ��"
				return [list 0 {} {}]	
			}
	}

proc IPMacBound {} {
			cd "$::g_python\\IPMac"
			set file "$::g_python\\IPMac\\IPMacBound.py"
	if	{[catch {set a [exec python.exe $file]} msg]} {
		puts "��IP_MACʧ��"
			   return [list 0 $msg {}]
		       } 
		if {[regexp "IP_Mac Bound Success" $a]} {
		     puts "��IP_MAC�ɹ�"
			return [list 1 {} {}]
			} else {
				puts "��IP_MACʧ��"
				return [list 0 {} {}]	
			}
	}

proc IPMacUnbound {} {
			cd "$::g_python\\IPMac"
			set file "$::g_python\\IPMac\\IPMacUnbound.py"
	if	{[catch {set a [exec python.exe $file]} msg]} {
		puts "���IP_MACʧ��"
			   return [list 0 $msg {}]
		       } 
		if {[regexp "IP_Mac Unbound Success" $a]} {
		     puts "���IP_MAC�ɹ�"
			return [list 1 {} {}]
			} else {
				puts "���IP_MACʧ��"
				return [list 0 {} {}]	
			}
	}


proc ClearIPMacconfig {} {
	set status 1
	while {[lindex $status 0]!=0} {
		set status [IP_MacDel]
	}
	return [1 {} {}]
}
