#!/bin/sh
# test1.tcl \
exec tclsh "$0" ${1+"$@"}

#��ʼ������ȡlib ��ȡȫ�ֱ�����
#source "C:\\Users\\ban\\workspace\\Test\\init.tcl"

#��ȡCFG

#��ʼflagΪ1

if { [catch { 

	set b [SshPs "$::g_python\\Case3.py"]
	puts $b
	

} ErrorMessage ]} {
  set script_flag 0    
  puts ErrorMessage:$ErrorMessage
}
	
	#Print script report

		
