#!/bin/sh
# test1.tcl \
exec tclsh "$0" ${1+"$@"}
source "d:\\svn1\\workspace\\Test\\init.tcl"

set file "$::g_web_python\\HttpPost.py"
#set a [GetUserList 13 ]
#set temp [split $a ,]
#puts $temp
#foreach abc $temp {
#	puts [split $abc :]
#	
#}
#set i 1
#ClearGroupTree
#set Add [AddUserGroup 1 1]
#while {$i<100} {
#
#set Add [AddUserGroup [lindex $Add 2] $i]
#	incr i
#}
#set e  [GetAllUser]
#puts "count: [llength $e]"
#puts $e
#set d [GetUserInfoByUgid 13]
#puts $d
#set e [GetUserIdByname 13 admin]
#puts $e
#	if {[regexp ugid $arg]} {
#	set ugid [lindex [split [lindex $temp $x] :] end] 
#        set ugname   [lindex [split [lindex $temp [expr $x+1]] :] end] 
#	set userid   [lindex [split [lindex $temp [expr $x+2]] :] end] 
#	set userip [lindex [split [lindex $temp [expr $x+3]] :] end] 
#	set username [lindex [split [lindex $temp [expr $x+4]] :] end] 
#}
#	
#set a [GetAllUser]
#puts $a
#Add
#set b [HttpPost "$::g_web_python\\HttpPost.py" AddTime timename:$timename,timedesc:d,week:Mon@Tue,from1:09:00:00,to1:12:00:00,from2:14:00:00,to2:18:00:00]
#Get
#set a [GetAllGroupId]
#set d [AddUserGroup 13 agggg]
#set d [HttpPost AddUserGroup pugid:2,ugname:aa2]
#puts $d
puts [GetAllUser]
puts [GetUserInfoByUgid 2]
puts [ClearAllUser]
#set e [AddUserGroup pugid 1 ugname abcd]
#puts $e
#set ugid [lindex $e 2]
#set AddRet1 [AddUser ugid $ugid username "Autotest1" userip "2.1.1.3"]
#set AddRet2 [AddUser ugid $ugid username "Autotest2" userip "1.1.1.2"]
#set id1 [lindex $AddRet1 2]
#set id2 [lindex $AddRet2 2]
#set MovRet [MoveUsers users "$id1@$id2" pugid 1]
#puts $MovRet
#DeleteUsersByid $id1
#DeleteUsersByid $id2
#set f [DeleteUserGroupByid [lindex $e 2]]
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