#!/bin/sh
# test1.tcl \
exec tclsh "$0" ${1+"$@"}

#��ʼ������ȡlib ��ȡȫ�ֱ�����
source "d:\\svn1\\workspace\\Test\\init.tcl"

#��ȡCFG
set Getall [GetCfg]
set dataall [lindex [GetCfg] 1]
set cfgnum [lindex [GetCfg] 0]
set cfgname [lindex [GetCfg] 2]
set datalength [lindex [GetCfg] 3]
puts $cfgnum
set i 0
while {$i<$cfgnum} {
set data [lindex $dataall $i]
for {set j 0} {$j<$datalength} {incr j} {
	set b [lindex $cfgname $j]
	set c [lindex [split $data ,] $j]		
	set cfg($b) $c
}

#��ʼflagΪ1
set script_flag 1  

if { [catch { 
#Ԥ������
	set TestCaseNo $cfg(TestCaseNo)
	puts "TestCase:$TestCaseNo Start"
#����ִ��
	set b "$::g_python\\Login.py"
	puts $b
	catch {exec python.exe $b} msg
	puts $msg
	
	

#����ж�
	puts "TestCase:$TestCaseNo End"
} ErrorMessage ]} {
  set script_flag 0    
  puts ErrorMessage:$ErrorMessage
}
	
	#Print script report

	SetTestcaseResult $TestCaseNo [expr {$script_flag == 1 ? "PASS" : "FAIL"}] 
	incr i
}
		
