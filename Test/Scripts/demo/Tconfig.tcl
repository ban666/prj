#!/bin/sh
# Tconfig.tcl \
exec tclsh "$0" ${1+"$@"}
source "d:\\svn1\\workspace\\Test\\init.tcl"
set a 1
while {[lindex $a 0]!=0} {
	set a [TimeDel]
	puts $a
}
