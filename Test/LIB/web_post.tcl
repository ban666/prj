#!/bin/sh
# webpy.tcl \
exec tclsh "$0" ${1+"$@"}

#-----------------------
#���ܣ�����HttpPost����
#--------------------------
proc HttpPost {cmd args } {
		encoding system utf-8	
	set file "$::g_web_python\\HttpPost.py"
	ShowMessage "��������Ϊ��$cmd \[$args\]"
    if	{[catch {exec python.exe $file $cmd $args} msg]} {
	    puts "���ؽ��Ϊ : \[$msg\]"
	    return [list 0 $msg {}]
	} else {
		ShowMessage "���ؽ��Ϊ : \[$msg\]"
		regexp {.*\[(.*)\].*} $msg whole rmsg
		return [list 1 $msg {}]
	}
}


proc CheckResult {content} {
	set flag [lindex [split [lindex [split $content ,] 0] :] end]
	set msg [lindex [split [lindex [split [lindex [split $content ,] 1] :] end] \"] 1]
		if {[string equal true $flag]} {
			set status 1
		} else {
			set status 0
		}
		
		return [list $status $msg {}]
}


