#!/bin/sh
# test1.tcl \
exec tclsh "$0" ${1+"$@"}

#��ʼ������ȡlib ��ȡȫ�ֱ�����
source "d:\\svn1\\workspace\\Test\\init.tcl"

#��ȡCFG

#��ʼflagΪ1

if { [catch { 

	set b [SshPing "$::g_python\\SShping.py" 192.168.13.13]
	puts $b
	
	

} ErrorMessage ]} {
  set script_flag 0    
  puts ErrorMessage:$ErrorMessage
}
	
	#Print script report

		
