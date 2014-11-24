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
	set cmd $cfg(cmd)
	regsub -all "@" $cmd , cmd
	set delcmd $cfg(delcmd)
	ShowMessage "TestCase:$TestCaseNo $TestCaseName Start\n"
	
set Addc1 [AddChannel chid 1]
        puts "���ؽ����$Addc1"
set Addc2 [AddChannel $cmd]
	puts "���ؽ����$Addc2"	
set Delc1 [DelChannel chid 1]
	puts "���ؽ����$Delc1"
set Delc2 [DelChannel $delcmd]
	puts "���ؽ����$Delc2"	
	#����ִ��
if {$Addc1==1&&$Addc2==0&&$Delc1==1&&$Delc2==0} {
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
	ShowMessage "TestCase:$TestCaseNo $TestCaseName End\n"	
	SetTestcaseResult $TestCaseNo [expr {$script_flag == 1 ? "PASS" : "FAIL"}]
		incr i
	
	}
