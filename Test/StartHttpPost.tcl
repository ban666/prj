#!/bin/sh
# Dhcp.tcl \
exec tclsh "$0" ${1+"$@"}
#初始化（读取lib 读取全局变量）
source "[string trimright [info script] StartHttpPost.tcl]init.tcl"
source "[string trimright [info script] StartHttpPost.tcl]RCClient.tcl"
encoding system cp936
ClearResult
StartExcute "[string trimright [info script] StartHttpPost.tcl]Scripts" "HttpPost\\TimeModule"
StartExcute "[string trimright [info script] StartHttpPost.tcl]Scripts" "HttpPost\\Intranet"
GetResult