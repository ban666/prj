#!/bin/sh
# T1.tcl \
exec tclsh "$0" ${1+"$@"}
proc Timerange {times} {
set iHour [expr $times/3600]
set iMin [expr ($times-$iHour*3600)/60]
set iSen [expr $times-$iHour*3600-$iMin*60]
return [list $iHour $iMin $iSen]
}