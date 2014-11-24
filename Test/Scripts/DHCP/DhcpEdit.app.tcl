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
	ShowMessage "TestCase:$TestCaseNo $TestCaseName Start\n"
	
	#测试数据读取
	set parameter $cfg(parameter)
	set expectresult $cfg(expectresult)
	
	#测试执行
	ShowMessage "------------开始添加DHCP规则-----------------------"
	set DhcpAddRet [DhcpAdd ""]
	if {[lindex $DhcpAddRet 0]==0} {
		puts "添加DHCP失败"
		set script_flag 0
		return 0
	}
	ShowMessage "------------开始编辑DHCP规则：$parameter------------"
	if {$expectresult==0} {
	ShowMessage "------------预期结果为：编辑DHCP失败------------------"		
	} else {
	ShowMessage "------------预期结果为：编辑DHCP成功------------------"		
	}
	set DhcpEditRet [DhcpEdit $parameter]
	if {[lindex $DhcpEditRet 0]==0} {
		ShowMessage "------------实际结果为：编辑DHCP失败------------------"		
		} else {
		ShowMessage "------------实际结果为：编辑DHCP成功------------------"		
		}
	
	#结果判断
	if {[lindex $DhcpEditRet 0]!=$expectresult} {
		ShowMessage "------------预期结果与实际结果不一致！------------------"
		set script_flag 0
	} else {
	ShowMessage "------------预期结果与实际结果一致！-------------------"		
	}
	
	
	
} ErrorMessage ]} {
  set script_flag 0    
  puts ErrorMessage:$ErrorMessage
}
	#恢复环境
	DhcpDel	
	#Print script report
	ShowMessage [PrintScriptResult "$script_flag"]
	ShowMessage "TestCase:$TestCaseNo $TestCaseName End\n"	
	SetTestcaseResult $TestCaseNo [expr {$script_flag == 1 ? "PASS" : "FAIL"}]
		incr i
	
	}
