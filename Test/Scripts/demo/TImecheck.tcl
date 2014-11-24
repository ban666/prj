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
	ShowMessage "TestCase:$TestCaseNo $TestCaseName Start"
	set par1 $cfg(par1)
	regsub -all "@" $par1 , par1
	set exp 0
        set down 40000
	set sec 10000
	set half 20000
	DelChannel chid 1
		set Addc1 [AddChannel chid 1 chpid 0 down $down up $down ]
	set Addc2 [AddChannel chid 2 chpid 1 down $down up $down enable 0]
	set Addc3 [AddChannel chid 3 chpid 2 down $sec max_down $sec max_up $sec up $sec weekday "Mon,Tue,Wed" apps "11" users "192.168.100.3"]
	set Addc4 [AddChannel chid 4 chpid 2 down $half up $half max_down $half max_up $half weekday "Thu,Fri,Sat" apps "30-35" users "192.168.100.2"]
	set Chgc2 [ChgChannel $par1]
        if {$Addc1==1&&$Addc2==1&&$Addc3==1&&$Addc4==1&&$Chgc2==$exp} {
        set script_flag 1
	puts "=============OK=========="	
        } else {
		set script_flag 0
		puts "=============Error!!!!=========="
        }
 DelChannel chid 1
	#测试执行



	#结果判断
} ErrorMessage ]} {
  set script_flag 0    
  puts ErrorMessage:$ErrorMessage
}
	
	#Print script report
	PrintScriptResult "$script_flag"
	ShowMessage "TestCase:$TestCaseNo $TestCaseName End"	
	SetTestcaseResult $TestCaseNo [expr {$script_flag == 1 ? "PASS" : "FAIL"}]
		incr i
	
	}
