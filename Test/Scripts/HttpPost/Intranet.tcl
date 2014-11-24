#!/bin/sh
# test1.tcl \
exec tclsh "$0" ${1+"$@"}
source "d:\\svn1\\workspace\\Test\\init.tcl"

set file "$::g_web_python\\HttpPost.py"
set timename e
GetIntranetList
puts [ClearIntranet]
pause
#Add
#set b [HttpPost "$::g_web_python\\HttpPost.py" AddTime timename:$timename,timedesc:d,week:Mon@Tue,from1:09:00:00,to1:12:00:00,from2:14:00:00,to2:18:00:00]
#Get
#set a [GetAllGroupId]
#puts $a
#set b [GetUserList [lindex [lindex $a 1] 4]]
#set d [AddUserGroup 1 Auto1]
set i 1
while {$i<100} {
set d [AddIntranet netName autotest$i netType subnet subnet 2.2.$i.0 mask 255.255.255.0 excludeList 2.2.$i.2]
incr i 
	puts $d
}
#set e [GetIntranetIdByname sdf]
#puts $e

#set f [UpdateIntranet id 20004 netName autotest2 netType range startAddr 1.1.1.1 endAddr 1.1.1.5 excludeList 1.1.1.4]
#puts $f
#set d [lindex $a 1]
#set a [GetTimeList "$::g_web_python\\HttpPost.py"]
#set c [ClearTime "$::g_web_python\\HttpPost.py"]
#puts $c
#set c [ClearGroupTree]
#puts $c
#set e [GetTimeId $d $timename]
#del
#set c [HttpPost "$::g_web_python\\HttpPost.py" DeleteTime timeid:$e]
