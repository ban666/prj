#!/bin/sh
# Dhcp.tcl \
exec tclsh "$0" ${1+"$@"}
#初始化（读取lib 读取全局变量）
source "[string trimright [info script] Dhcp.tcl]init.tcl"
source "[string trimright [info script] Dhcp.tcl]RCClient.tcl"
StartExcute "[string trimright [info script] Dhcp.tcl]Scripts" "DHCP"