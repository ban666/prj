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
	set cmd $cfg(cmd)
	regsub -all "@" $cmd , cmd
	set delcmd $cfg(delcmd)
	ShowMessage "TestCase:$TestCaseNo $TestCaseName Start\n"
	
set Addc1 [AddChannel chid 1]
        puts "返回结果：$Addc1"
set Addc2 [AddChannel $cmd]
	puts "返回结果：$Addc2"	
set Delc1 [DelChannel chid 1]
	puts "返回结果：$Delc1"
set Delc2 [DelChannel $delcmd]
	puts "返回结果：$Delc2"	
	#测试执行
if {$Addc1==1&&$Addc2==0&&$Delc1==1&&$Delc2==0} {
	set script_flag 1
	puts pass
} else {
	set script_flag 0
	puts failed
}


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
