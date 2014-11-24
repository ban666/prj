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
set ip $cfg(ip)
set count $cfg(count)
set size $cfg(size)
set timeout $cfg(timeout)
set interface $cfg(interface)
	
puts "\nTestCase:$TestCaseNo $TestCaseName Start\n"


	#测试执行
set b [SshPing "$::g_python\\SShping.py" $ip $count $size $timeout $interface]
puts $b


	#结果判断
set script_flag [lindex $b 0]
	
} ErrorMessage ]} {
  set script_flag 0    
  puts ErrorMessage:$ErrorMessage
}
	
	#Print script report
	PrintScriptResult "$script_flag"
	puts "\nTestCase:$TestCaseNo $TestCaseName End\n"	
	SetTestcaseResult $TestCaseNo [expr {$script_flag == 1 ? "PASS" : "FAIL"}]
		incr i
	
	}
