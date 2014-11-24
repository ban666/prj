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
	ShowMessage "TestCase:$TestCaseNo $TestCaseName Start"
	set times $cfg(times)
	set i 1
	ClearTime
	ShowMessage "===========ʱ�������ü��޲��Կ�ʼ============"
	while {$i<=$times} {
	set AddRet [AddTimeList timename $i]
	if {[lindex $AddRet 0]} {
	ShowMessage "------------��ӵ� $i ������ɹ�------------"
		incr i
	} else {
		ShowMessage "------------��ӵ� $i ������ʧ��------------"
	        set script_flag 0
		break
	}
	}
	ShowMessage "===========ʱ�������ü��޲��Խ���============"
	#����ִ��
	


	#����ж�
} ErrorMessage ]} {
	
  set script_flag 0    
  puts ErrorMessage:$ErrorMessage
}
	ClearTime
	#Print script report
	PrintScriptResult "$script_flag"
	ShowMessage "TestCase:$TestCaseNo $TestCaseName End"	
	SetTestcaseResult $TestCaseNo [expr {$script_flag == 1 ? "PASS" : "FAIL"}]
		incr i
	
	}
