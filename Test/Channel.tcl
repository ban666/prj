#!/bin/sh
# Dhcp.tcl \
exec tclsh "$0" ${1+"$@"}
#��ʼ������ȡlib ��ȡȫ�ֱ�����
source "[string trimright [info script] Channel.tcl]init.tcl"
source "[string trimright [info script] Channel.tcl]RCClient.tcl"
ClearResult
StartExcute "[string trimright [info script] Channel.tcl]Scripts" "Channel"
GetResult