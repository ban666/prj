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
	set params $cfg(params)
	set expect $cfg(expect)
	ShowMessage "===========Env Restore============"
	
	ShowMessage "===========Test Start============"
	set AddRet [AddUser $params]
	if {$expect==[lindex $AddRet 0]} {
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
	DeleteUsersByid [lindex $AddRet 2]
	#Print script report
	PrintScriptResult "$script_flag"
	ShowMessage "TestCase:$TestCaseNo $TestCaseName End\n"	
	SetTestcaseResult $TestCaseNo [expr {$script_flag == 1 ? "PASS" : "FAIL"}]
		incr i
	
	}
