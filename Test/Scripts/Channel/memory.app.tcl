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
	
	#puts "���ؽ����$Delc1"
	DelChannel chid 1
	
        
	set j 1
	while {$j<100} {
		set down 400000
		set half 200000
		set NowTime [clock format [clock seconds] -format "%Y��%m��%d�� %H:%M:%S"]
		puts "$NowTime:---------------------times:$j start---------------------"
		set Addc [AddChannel chid 1 chpid 0 down $down max_down $down up $down max_up $down ]
	for {set i 1} {$i<64} {incr i} {
	set Addc1 [AddChannel chid [expr $i*2] chpid $i down $half max_down $half max_up $half up $half ]
	set Addc2 [AddChannel chid [expr $i*2+1] chpid $i down $half max_down $half max_up $half up $half  ]
	if {$Addc1==0||$Addc2==0} {
		set script_flag 0
		set NowTime [clock format [clock seconds] -format "%Y��%m��%d�� %H:%M:%S"]
		puts "$NowTime:Error!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
	
	}
		set half [expr $half/2]	
			}
		set Delc1 [DelChannel chid [expr $i/2] chpid [expr $i/4]]
	        set Addc3 [AddChannel chid $i chpid [expr $i/2] down 1250 up 1250]
	        set Addc4 [AddChannel chid [expr $i/2] chpid [expr $i/4] down 10000 up 10000]
		
		if {$Delc1==0||$Addc3==1||$Addc4==0} {
			set script_flag 0
				set NowTime [clock format [clock seconds] -format "%Y��%m��%d�� %H:%M:%S"]
				puts "$NowTime:Error!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
		
		
	}
		DelChannel chid 1
		set NowTime [clock format [clock seconds] -format "%Y��%m��%d�� %H:%M:%S"]
		puts "$NowTime:---------------------times:$j end---------------------"
		incr j
	}
 
	#����ִ��



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
