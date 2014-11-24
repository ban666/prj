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
	set parameter $cfg(parameter)
	set expectresult $cfg(expectresult)
	
	#����ִ��
	ShowMessage "------------��ʼ���DHCP����-----------------------"
	set DhcpAddRet [DhcpAdd ""]
	if {[lindex $DhcpAddRet 0]==0} {
		puts "���DHCPʧ��"
		set script_flag 0
		return 0
	}
	ShowMessage "------------��ʼ�༭DHCP����$parameter------------"
	if {$expectresult==0} {
	ShowMessage "------------Ԥ�ڽ��Ϊ���༭DHCPʧ��------------------"		
	} else {
	ShowMessage "------------Ԥ�ڽ��Ϊ���༭DHCP�ɹ�------------------"		
	}
	set DhcpEditRet [DhcpEdit $parameter]
	if {[lindex $DhcpEditRet 0]==0} {
		ShowMessage "------------ʵ�ʽ��Ϊ���༭DHCPʧ��------------------"		
		} else {
		ShowMessage "------------ʵ�ʽ��Ϊ���༭DHCP�ɹ�------------------"		
		}
	
	#����ж�
	if {[lindex $DhcpEditRet 0]!=$expectresult} {
		ShowMessage "------------Ԥ�ڽ����ʵ�ʽ����һ�£�------------------"
		set script_flag 0
	} else {
	ShowMessage "------------Ԥ�ڽ����ʵ�ʽ��һ�£�-------------------"		
	}
	
	
	
} ErrorMessage ]} {
  set script_flag 0    
  puts ErrorMessage:$ErrorMessage
}
	#�ָ�����
	DhcpDel	
	#Print script report
	ShowMessage [PrintScriptResult "$script_flag"]
	ShowMessage "TestCase:$TestCaseNo $TestCaseName End\n"	
	SetTestcaseResult $TestCaseNo [expr {$script_flag == 1 ? "PASS" : "FAIL"}]
		incr i
	
	}
