#!/bin/sh
# webpy.tcl \
exec tclsh "$0" ${1+"$@"}

#通过python脚本ssh登陆到设备并执行命令
namespace eval web_User {
}



#--------------------------
#功能：获取用户列表
#--------------------------
proc Restart {} {
	set Result [HttpPost Restart page:all]
	set Ret [CheckResult $Result]
	return $Ret
}

