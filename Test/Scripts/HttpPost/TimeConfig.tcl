#!/bin/sh
# test1.tcl \
exec tclsh "$0" ${1+"$@"}
source "d:\\svn1\\workspace\\Test\\init.tcl"

set file "$::g_web_python\\HttpPost.py"
set timename e
#set a [GetTimeList ]
#Add
puts [AddTimeList]
ClearTime
#Get

#set a [AddTimeList timedesc a1 week Mon@Tue from1 09:00:00 to1 11:00:00 from2 12:00:00 to2 14:00:00]
#set d [lindex $a 1]
#set a [GetTimeList "$::g_web_python\\HttpPost.py"]
#set c [ClearTime ]
#puts $c

#set e [GetTimeId $d $timename]
#del
#set c [HttpPost "$::g_web_python\\HttpPost.py" DeleteTime timeid:$e]
