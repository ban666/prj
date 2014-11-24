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
	#测试数据读取
	ShowMessage "TestCase:$TestCaseNo $TestCaseName Start"
	set par1 $cfg(par1)
	regsub -all "@" $par1 , par1
	set exp 0
        set down 40000
	DelChannel chid 1
	set times 64
	#Add 100 C
	
	for {set k 1} {$k<=$times} {incr k} {
		set Addc1 [AddChannel chid $k chpid [expr $k-1] down $down max_down $down ]
		if {1!=[lindex $Addc1 0]} {
			set script_flag 0
			ShowMessage "Error!!!!!!!!!!!!!!!!!!!!!!"
			pause
		}
		incr down -1
	}
	
	ShowMessage "===============Add Complete============"
	#Change 100 C 100-1
	for {set k $times} {$k>1} {incr k -1} {
		incr down
			set Chgc1 [ChgChannel chid $k chpid [expr $k-1] down $down max_down $down ]
			if {1!=[lindex $Chgc1 0]} {
				set script_flag 0
				ShowMessage "Error!!!!!!!!!!!!!!!!!!!!!!"
				pause
			}
			
		}
		ShowMessage "===============Change 100-1 Complete============"	
	for {set k 2} {$k<=$times} {incr k} {
			incr down -1
				set Chgc2 [ChgChannel chid $k chpid [expr $k-1] down $down max_down $down ]
				if {1!=[lindex $Chgc2 0]} {
					set script_flag 0
					ShowMessage "Error!!!!!!!!!!!!!!!!!!!!!!"
					pause
				}
				
			}
			ShowMessage "===============Change 1-100 Complete============"			
 DelChannel chid 1
	#测试执行



	#结果判断
} ErrorMessage ]} {
  set script_flag 0    
  puts ErrorMessage:$ErrorMessage
}
	
	#Print script report
	PrintScriptResult "$script_flag"
	ShowMessage "TestCase:$TestCaseNo $TestCaseName End"	
	SetTestcaseResult $TestCaseNo [expr {$script_flag == 1 ? "PASS" : "FAIL"}]
		incr i
	
	}
