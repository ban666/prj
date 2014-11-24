#!/bin/sh
# test1.tcl \
exec tclsh "$0" ${1+"$@"}

#初始化（读取lib 读取全局变量）
source "d:\\svn1\\workspace\\Test\\init.tcl"
source "d:\\svn1\\workspace\\Test\\RCClient.tcl"
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
	
        ShowMessage "TestCase:$TestCaseNo $TestCaseName Start\n"
::GR_Client TestServer 192.168.20.10 32
	set i 30
puts "-----------开始抓包---------------\n-----------Duration：$i---------"
set a	[TestServer GR_eval [list Capture 4 tcp "e:\\test\\1.txt" $i "c:\\program files\\wireshark"] 0]
puts "返回结果：$a"
puts "-----------Start PingTest---------"
set	b [Pingtest www.baidu.com]
puts "返回结果：$b"
puts "-----------wait for $i\s---------"
	after [expr $i*1000]
	puts "-----------检测Dns是否解析成功---------"	
	set c [Exsitcheck 115.239.210.26 "e:\\test\\1.txt"]
	puts "返回结果：$b"
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
