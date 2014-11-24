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
	ShowMessage "TestCase:$TestCaseNo $TestCaseName Start\n"
	
	#�������ݶ�ȡ
	
	#����ִ��
	ShowMessage "------------��ʼ���ʱ�������------------"
	set TimeAddRet [TimeAdd]
	if {[lindex $TimeAddRet 0]==0} {
	        puts "���ʱ����ʧ��"
		set script_flag 0
		return 0
	}
	ShowMessage "------------��ʼɾ��ʱ�������------------"
	ShowMessage "------------Ԥ�ڽ��Ϊ��ɾ��ʱ����ɹ�------------"	
	set TimeDelRet [TimeDel]
	if {[lindex $TimeDelRet 0]==0} {
		ShowMessage "------------ʵ�ʽ��Ϊ��ɾ��ʱ����ʧ��------------"		
		} else {
		ShowMessage "------------ʵ�ʽ��Ϊ��ɾ��ʱ����ɹ�------------"		
		}
	
	#����ж�
        if {[lindex $TimeDelRet 0]==0} {
		ShowMessage "------------Ԥ�ڽ����ʵ�ʽ����һ�£�------------"
		set script_flag 0
	} else {
	ShowMessage "------------Ԥ�ڽ����ʵ�ʽ��һ�£�------------"		
	}
	
	
        
} ErrorMessage ]} {
  set script_flag 0    
  puts ErrorMessage:$ErrorMessage
}
	#�ָ�����
	TimeDel 
	#Print script report
	PrintScriptResult "$script_flag"
	ShowMessage "TestCase:$TestCaseNo $TestCaseName End\n"	
	SetTestcaseResult $TestCaseNo [expr {$script_flag == 1 ? "PASS" : "FAIL"}]
		incr i
	
	}
