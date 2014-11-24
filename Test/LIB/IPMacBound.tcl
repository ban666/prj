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
	puts "Ìí¼ÓIP_MACÊ§°Ü"
	puts $msg
		   return [list 0 $msg {}]
	       } 
	if {[regexp "IP_Mac Add Success" $a]} {
	     puts "Ìí¼ÓIP_MAC³É¹¦"
		return [list 1 {} {}]
		} else {
			puts "Ìí¼ÓIP_MACÊ§°Ü"
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
	puts "±à¼­IP_MACÊ§°Ü"
		   return [list 0 $msg {}]
	       } 
	if {[regexp "IP_Mac Edit Success" $a]} {
	     puts "±à¼­IP_MAC³É¹¦"
		return [list 1 {} {}]
		} else {
			puts "±à¼­IP_MACÊ§°Ü"
			return [list 0 {} {}]	
		}
}

proc IPMacDel {} {
			cd "$::g_python\\IPMac"
			set file "$::g_python\\IPMac\\IPMacDel.py"
	if	{[catch {set a [exec python.exe $file]} msg]} {
		puts "É¾³ýIP_MACÊ§°Ü"
			   return [list 0 $msg {}]
		       } 
		if {[regexp "IP_Mac Del Success" $a]} {
		     puts "É¾³ýIP_MAC³É¹¦"
			return [list 1 {} {}]
			} else {
				puts "É¾³ýIP_MACÊ§°Ü"
				return [list 0 {} {}]	
			}
	}

proc IPMacBound {} {
			cd "$::g_python\\IPMac"
			set file "$::g_python\\IPMac\\IPMacBound.py"
	if	{[catch {set a [exec python.exe $file]} msg]} {
		puts "°ó¶¨IP_MACÊ§°Ü"
			   return [list 0 $msg {}]
		       } 
		if {[regexp "IP_Mac Bound Success" $a]} {
		     puts "°ó¶¨IP_MAC³É¹¦"
			return [list 1 {} {}]
			} else {
				puts "°ó¶¨IP_MACÊ§°Ü"
				return [list 0 {} {}]	
			}
	}

proc IPMacUnbound {} {
			cd "$::g_python\\IPMac"
			set file "$::g_python\\IPMac\\IPMacUnbound.py"
	if	{[catch {set a [exec python.exe $file]} msg]} {
		puts "½â°óIP_MACÊ§°Ü"
			   return [list 0 $msg {}]
		       } 
		if {[regexp "IP_Mac Unbound Success" $a]} {
		     puts "½â°óIP_MAC³É¹¦"
			return [list 1 {} {}]
			} else {
				puts "½â°óIP_MACÊ§°Ü"
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
