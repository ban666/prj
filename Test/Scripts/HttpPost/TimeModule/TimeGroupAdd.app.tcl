#!/bin/sh
# test1.tcl \
exec tclsh "$0" ${1+"$@"}

#��ʼ������ȡlib ��ȡȫ�ֱ�����
#source "d:\\svn1\\workspace\\Test\\init.tcl"

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
	ShowMessage "TestCase:$TestCaseNo $TestCaseName Start\n"
	set params $cfg(params)
	set expect $cfg(expect)
	ShowMessage "===========�ָ�����============"
	ClearTime
	ShowMessage "===========ʱ�������ò��Կ�ʼ============"
	set AddRet [AddTimeList $params]
	if {$expect==[lindex $AddRet 0]} {
	ShowMessage "===========�����Ԥ�����============"
	} else {
		ShowMessage "===========�����Ԥ�ڲ���============"
	        set script_flag 0
	}
	ShowMessage "===========ʱ�������ò��Խ���============"
	#����ִ��
	


	#����ж�
} ErrorMessage ]} {
	
  set script_flag 0    
  puts ErrorMessage:$ErrorMessage
}
	ClearTime
	#Print script report
	puts "\n"
	PrintScriptResult "$script_flag"
	ShowMessage "TestCase:$TestCaseNo $TestCaseName End\n"	
	SetTestcaseResult $TestCaseNo [expr {$script_flag == 1 ? "PASS" : "FAIL"}]
		incr i
	
	}
