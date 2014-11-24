#!/bin/sh
# test1.tcl \
exec tclsh "$0" ${1+"$@"}

#初始化（读取lib 读取全局变量）
source "d:\\svn1\\workspace\\Test\\init.tcl"


	
#	set b [ReadByLine "f:\\time.log"]
#
#	foreach arg $b {
#		set a [Timecheck $arg]	
#		puts $a
#		if {[string equal "-12" $a]} {
#		        puts "111111111111111111:$arg"
#			lappend lista $arg 
#		}
#	}
#	puts $lista

puts [AddDestIPControl ip 2.2.2.2 usertype all timeid 1 enable 1]