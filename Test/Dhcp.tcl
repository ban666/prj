#!/bin/sh
# Dhcp.tcl \
exec tclsh "$0" ${1+"$@"}
#��ʼ������ȡlib ��ȡȫ�ֱ�����
source "[string trimright [info script] Dhcp.tcl]init.tcl"
source "[string trimright [info script] Dhcp.tcl]RCClient.tcl"
StartExcute "[string trimright [info script] Dhcp.tcl]Scripts" "DHCP"