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
set TestCaseName $cfg(TestCaseName)
	
	#�������ݶ�ȡ
set no1 $cfg(no1)
set no2 $cfg(no2)
	
puts "TestCase:$TestCaseNo $TestCaseName Start\n"


	#����ִ��
set b "$::g_python\\Case3.py"
set cmd "ps"
if {[catch {exec python.exe $b $no1} msg]} {
	set script_flag 0    
	puts ErrorMessage:$msg
      }	

puts "----------Log----------:\n$msg\n----------Log----------"

set d [split [lindex [split $msg \n] 1] ,]
	#����ж�
puts "TestCase:$TestCaseNo $TestCaseName End\n"
} ErrorMessage ]} {
  set script_flag 0    
  puts ErrorMessage:$ErrorMessage
}
	
	#Print script report
	PrintScriptResult "$script_flag\n\n"
	SetTestcaseResult $TestCaseNo [expr {$script_flag == 1 ? "PASS" : "FAIL"}]  $ErrorMessage
		incr i
	
	}
