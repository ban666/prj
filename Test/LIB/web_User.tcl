#!/bin/sh
# webpy.tcl \
exec tclsh "$0" ${1+"$@"}

#通过python脚本ssh登陆到设备并执行命令
namespace eval web_User {
}



#--------------------------
#功能：获取用户列表
#--------------------------
proc GetUserList {ugid {page 1} {rows 20} } {
	set file "$::g_web_python\\HttpPost.py"
	set Result [HttpPost GetUserList ugid:$ugid,page:$page,rows:$rows]
	return $Result
}

#--------------------------
#功能：获取所有用户
#--------------------------
proc GetAllUser { {page 1} {rows 20} } {
	set GetAllIdRet [lindex [GetAllGroupId] 1]
	set list ""
	foreach id $GetAllIdRet {
	set Ret [GetUserInfoByUgid $id $page $rows]
		if {1!=[string equal "" $Ret]} {
	lappend list $Ret
	}
	}
	foreach arg $list {
		for {set x 0} {$x<[llength $arg]} {incr x} {
			lappend Retlist [lindex $arg $x]
			
		}
		
	}
	return $Retlist
}

proc GetUserInfoByUgid {ugid {page 1} {rows 20}} {
	set list ""
	set Result [HttpPost GetUserList ugid:$ugid,page:$page,rows:$rows]
	set temp [split $Result ,]
		
		for {set x 0} {$x<[llength $temp]} {incr x} {
			if {[regexp ugid [lindex $temp $x]]} {
				
			set ugid [lindex [split [lindex $temp $x] :] end] 
			set ugname   [lindex [split [lindex $temp [expr $x+1]] :] end]
				regsub -all \" $ugname "" ugname
			set userid   [lindex [split [lindex $temp [expr $x+2]] :] end] 
			set userip [lindex [split [lindex $temp [expr $x+3]] :] end] 
				regsub -all \" $userip "" userip
			set username [lindex [split [lindex $temp [expr $x+4]] :] end]
				regexp {\"(.*)\"} $username username
				regsub -all \" $username "" username
			set lista [list $ugid $ugname $userid $userip $username]
				lappend list $lista
			}
		}
	return $list
	}
     

#--------------------------
#功能：获取时间组ID
#--------------------------
proc GetUserIdByname {ugid name {page 1} {rows 20}} {
	set idlist ""
	set iplist ""
	set Info [GetUserInfoByUgid $ugid $page $rows]
	foreach list $Info {
		if {[regexp $name [lindex $list 4]]} {
		lappend idlist [lindex $list 2]
		regsub -all \" [lindex $list 3] "" ip
		lappend iplist $ip
	}
	}
	return [list $idlist $iplist]
}


#--------------------------
#功能：获取用户组列表
#--------------------------
proc GetGroupTree {} {
	
	set Result [HttpPost GetGroupTree page:all]
	return $Result
}

#--------------------------
#功能：获取所有用户组ID
#--------------------------
proc GetAllGroupId {{page 1} {rows 20}} {
	set id ""
	set list ""
	set lista ""
	set listb ""
	set listc ""
	set text ""
	set content [GetGroupTree]
	set temp [split $content ,]
 foreach arg $temp {
	 if {[regexp \"id\": $arg]} {
		 lappend list [lindex [split $arg :] end]
		 lappend listid [lindex [split $arg :] end]
		 
	 }
	 if {[regexp \"text\": $arg]} {
		 set Ret [lindex [split $arg :] end]
		 regsub -all \" $Ret "" temp 
			  lappend list $temp
		 lappend listname $temp
			  
		  }
 }
	foreach {i j} $list {
		lappend lista [list $i $j]
	}
	return [list $lista $listid $listname]
}

#--------------------------
#功能：删除用户组列表
#--------------------------
proc DeleteUserGroupByid {id } {
set Result [HttpPost DeleteUsergroup ugid:$id]
set Ret [CheckResult $Result]
	return $Ret
}


proc DeleteUsersByid {id } {
set Result [HttpPost DeleteUsers users:$id]
set Ret [CheckResult $Result]
	return $Ret
}


proc DeleteUserGroupByname {name } {
     set GetRet [lindex GetAllGroupId 0]
	foreach arg $GetRet {
	if {[string equal $name [lindex $arg 1]]} {
		set id [lindex $arg 0]
		break
	}
	}
set Result [HttpPost DeleteUsergroup ugid:$id]
set Ret [CheckResult $Result]
	return $Ret
}

#--------------------------
#功能：清空用户组列表
#--------------------------
proc ClearGroupTree {} {
	
	set status 1
	set GetAllIdRet [lindex [GetAllGroupId] 1]
	set List [lrange $GetAllIdRet 1 end]
	set Flist ""
	set flag 1
	foreach id $List {
		if {$id!=2} {
		set flag [lindex [DeleteUserGroupByid $id] 0]
		}
		if {$flag!=1} {
			puts "删除 $id 号用户组失败"
			set flag 0
			lappend Flist $id
		}
		set status [expr $status&&$flag]
		}
		return [list $status $Flist {}]
	}

#--------------------------
#功能：添加用户组
#--------------------------
proc AddUserGroup {args } {
	array set list {pugid "1"\
			ugname ""\
			}
				if {[regexp  {{(.*)}} $args wholes list2 ]} {
					 foreach {i j} $list2 {
						 set list($i) $j
					 }
					}	
					foreach {i j} $args {
							set list($i) $j
						}
set Result [HttpPost AddUsergroup pugid:$list(pugid),ugname:$list(ugname)]
set Ret [CheckResult $Result]
	if {1==[lindex $Ret 0]} {
		set id	[lindex [split [lindex [split $Result ,] 2] :] end]
		set RetList [list 1 [lindex $Ret 1] $id]
		return $RetList
		} else {
		return $Ret
			
		}
}


#--------------------------
#功能：添加用户组
#--------------------------
proc AddUser {args } {
	array set list {ugid "1"\
				username "Autotest"\
				userip "1.1.1.1"\
				}
			if {[regexp  {{(.*)}} $args wholes list2 ]} {
				 foreach {i j} $list2 {
					 set list($i) $j
				 }
				}	
				foreach {i j} $args {
						set list($i) $j
					}
set Result [HttpPost AddUser ugid:$list(ugid),username:$list(username),userip:$list(userip)]
set Id	[lindex [GetUserIdByname $list(ugid) $list(username)] 0]	
set Ret [lreplace [CheckResult $Result] 2 2 $Id]
	return $Ret
	
}

#update
proc UpdateUser {args } {
	array set list {ugid "1"\
                        userid ""\
				username "Autotest"\
				userip "1.1.1.1"\
				}
			if {[regexp  {{(.*)}} $args wholes list2 ]} {
				 foreach {i j} $list2 {
					 set list($i) $j
				 }
				}	
				foreach {i j} $args {
						set list($i) $j
					}
set Result [HttpPost UpdateUser userid:$list(userid),ugid:$list(ugid),username:$list(username),userip:$list(userip)]
set Id	[lindex [GetUserIdByname $list(ugid) $list(username)] 0]	
set Ret [lreplace [CheckResult $Result] 2 2 $Id]
	return $Ret
	
}

#Move
proc MoveUsers {args } {
	array set list {users ""\
			pugid ""\
			}
				if {[regexp  {{(.*)}} $args wholes list2 ]} {
					 foreach {i j} $list2 {
						 set list($i) $j
					 }
					}	
					foreach {i j} $args {
							set list($i) $j
						}
set Result [HttpPost MoveUsers users:$list(users),pugid:$list(pugid)]
set Ret [CheckResult $Result]
		return $Ret
			
}

#Clear
proc ClearAllUser { {page 1} {rows 20} } {
	set status 1
	set GetAllIdRet [GetAllUser]
	set lista ""
	foreach arg $GetAllIdRet {
	set id [lindex $arg 2]
	set DelRet [DeleteUsersByid $id]
	if {1!=[lindex $DelRet 0]} {
		set status 0
		lappend $lista $id
	   }
	}
	
	return [list $status $lista {}]
}