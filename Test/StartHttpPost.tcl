#!/bin/sh
# Dhcp.tcl \
exec tclsh "$0" ${1+"$@"}
#��ʼ������ȡlib ��ȡȫ�ֱ�����
source "[string trimright [info script] StartHttpPost.tcl]init.tcl"
source "[string trimright [info script] StartHttpPost.tcl]RCClient.tcl"
encoding system cp936
ClearResult
StartExcute "[string trimright [info script] StartHttpPost.tcl]Scripts" "HttpPost\\TimeModule"
StartExcute "[string trimright [info script] StartHttpPost.tcl]Scripts" "HttpPost\\Intranet"
GetResult