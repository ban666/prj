#!/bin/sh
# webpy.tcl \
exec tclsh "$0" ${1+"$@"}

#ͨ��python�ű�ssh��½���豸��ִ������
namespace eval web_User {
}



#--------------------------
#���ܣ���ȡ�û��б�
#--------------------------
proc Restart {} {
	set Result [HttpPost Restart page:all]
	set Ret [CheckResult $Result]
	return $Ret
}

