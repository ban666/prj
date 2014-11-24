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
	set cmd1 $cfg(cmd1)
	regsub -all "@" $cmd1 , cmd1
	set cmd2 $cfg(cmd2)
	regsub -all "@" $cmd2 , cmd2
	puts "\nTestCase:$TestCaseNo $TestCaseName Start\n"
	set Delc [DelChannel chid 1]
set Addc1 [AddChannel chid 1]
        puts "���ؽ����$Addc1"
set Addc2 [AddChannel chid 2 chpid 1]
	puts "���ؽ����$Addc2"	
set Addc3 [AddChannel $cmd1]
	puts "���ؽ����$Addc3"
set Delc1 [DelChannel chid 1]
	puts "���ؽ����$Delc1"
	#����ִ��
if {$Addc1==1&&$Addc2==1&&$Addc3==0&&$Delc1==1} {
	set script_flag 1
	puts pass
} else {
	set script_flag 0
	puts failed
}


	#����ж�
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
