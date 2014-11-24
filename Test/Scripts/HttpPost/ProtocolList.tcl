#!/bin/sh
# test1.tcl \
exec tclsh "$0" ${1+"$@"}
source "d:\\svn1\\workspace\\Test\\init.tcl"

set file "$::g_web_python\\HttpPost.py"
set timename e
set a [GetAllProtocolId]
puts $a
set b [ClearPortProtocol]
puts $b
#Add
#set b [HttpPost "$::g_web_python\\HttpPost.py" AddTime timename:$timename,timedesc:d,week:Mon@Tue,from1:09:00:00,to1:12:00:00,from2:14:00:00,to2:18:00:00]
#Get
#set a [GetAllGroupId]
#set i 1
#while {$i<10} {
#set d [UpdatePortProtocol 2 tcp d_tcpport 80 all 3]
#set d [UpdatePortProtocol 2 tcp d_tcpport 80 all 4]
#set d [UpdatePortProtocol 2 tcp d_tcpport 80 all 1]
#	
#}
#set d [HttpPost AddUserGroup pugid:2,ugname:aa2]

#set d [lindex $a 1]
#set a [GetTimeList "$::g_web_python\\HttpPost.py"]
#set c [ClearTime "$::g_web_python\\HttpPost.py"]
#puts $c
#set c [ClearGroupTree]
#puts $c
#set e [GetTimeId $d $timename]
#del
#set c [HttpPost "$::g_web_python\\HttpPost.py" DeleteTime timeid:$e]
