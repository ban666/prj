#!/bin/sh
# test1.tcl \
exec tclsh "$0" ${1+"$@"}

#初始化（读取lib 读取全局变量）
source "d:\\svn1\\workspace\\Test\\init.tcl"
#读取CFG
	set Getall [GetCfg]
	set dataall [lindex [GetCfg] 1]
	set cfgnum [lindex [GetCfg] 0]
	set cfgname [lindex [GetCfg] 2]
	set datalength [lindex [GetCfg] 3]
	set i 0
	while {$i<$cfgnum} {
	set data [lindex $dataall $i]
	for {set j 0} {$j<$datalength} {incr j} {
		set b [lindex $cfgname $j]
		set c [lindex [split $data ,] $j]
		set cfg($b) $c
	}
	
       #初始flag为1
set script_flag 1  

if { [catch { 
	#预置条件
	set TestCaseNo $cfg(TestCaseNo)
	set TestCaseName $cfg(TestCaseName)
	#测试数据读取
	ShowMessage "TestCase:$TestCaseNo $TestCaseName Start\n"
	ShowMessage "===========Env Restore============"
	
	ShowMessage "===========Test Start============"
	set GAddRet [AddUserGroup pugid 1 ugname abcd]
	set ugid [lindex $GAddRet 2]
	set AddRet1 [AddUser ugid $ugid username "Autotest1" userip "2.1.1.3"]
	set AddRet2 [AddUser ugid $ugid username "Autotest2" userip "2.1.1.2"]
	set id1 [lindex $AddRet1 2]
	set id2 [lindex $AddRet2 2]
	set MovRet [MoveUsers users "$id1@$id2" pugid 1]
	set DelUser1 [DeleteUsersByid $id1]
	set DelUser2 [DeleteUsersByid $id2]
	set DelRet [DeleteUserGroupByid [lindex $GAddRet 2]]
	if {1==[lindex $MovRet 0]&&1==[lindex $DelRet 0]&&1==[lindex $DelUser1 0]&&1==[lindex $DelUser2 0]} {
	ShowMessage "===========Case Pass============"
	} else {
		ShowMessage "===========Case Failed============"
	        set script_flag 0
	}
	ShowMessage "===========Test End============"
	#测试执行
	


	#结果判断
} ErrorMessage ]} {
	
  set script_flag 0    
  puts ErrorMessage:$ErrorMessage
}
	#Print script report
	PrintScriptResult "$script_flag"
	ShowMessage "TestCase:$TestCaseNo $TestCaseName End\n"	
	SetTestcaseResult $TestCaseNo [expr {$script_flag == 1 ? "PASS" : "FAIL"}]
		incr i
	
	}
