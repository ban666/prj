#!/bin/sh
# test1.tcl \
exec tclsh "$0" ${1+"$@"}
source "d:\\svn1\\workspace\\Test\\init.tcl"






set atname Autotest
#Add
set b [HttpPost AddAvoidTactics  atname:$atname,usesel:seg,segments:20003,effectTime:timeval,tillTime:2014-04-24 10:38:38]
#set e [CheckResult $b]
#puts $e
#Get
set a [GetAvoidTactics ]
set c [GetAvoidTaticsId [lindex $a 1] $atname]

#Del
set d [DeleteAvoidTactics [lindex $a 1] $atname]
puts $d