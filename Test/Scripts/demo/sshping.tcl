#!/bin/sh
# test1.tcl \
exec tclsh "$0" ${1+"$@"}

#初始化（读取lib 读取全局变量）
source "d:\\svn1\\workspace\\Test\\init.tcl"

#读取CFG

#初始flag为1

if { [catch { 

	set b [SshPing "$::g_python\\SShping.py" 192.168.13.13]
	puts $b
	
	

} ErrorMessage ]} {
  set script_flag 0    
  puts ErrorMessage:$ErrorMessage
}
	
	#Print script report

		
