#����ITCL��
catch {package require Itcl}
catch {namespace import -force itcl::*}
 
proc Wrong { args } {
	puts <0,0,0>"(Error Message:)$args"<END>
	return 0
}

#��������Ӧ���� 
#ʹ��fileevent�ȴ��ͻ����ݣ�ʹ��fconfigure��������socket�Ļ�������ʽ��
proc EchoAccept {sock addr port} { 
	#��¼�ͻ�����Ϣ  
	#puts "Accept $sock form $addr port $port"  
	after 0 
	set channelID   $sock
	set clientIP  $addr
	set clientPort $port
	global echo  
	set echo(addr,$sock) [list $addr $port]   ;#����ʱ��ָʾSOCK��PORT��IP
	
	#����������Ϊ���д��� 
	fconfigure $sock -buffering line
 
	
	#������������buffering����ʱ���ð󶨺���
	fileevent $sock readable [list Echo $sock] 
}

#������������buffering����ʱ����
proc Echo {sock} {	
	global echo
	set currPath [info script] 
	set path [file dirname $currPath]   
			
	if { [eof $sock] || [catch {gets $sock line}] } {  	
		close $sock  		
		unset echo(addr,$sock) ;  		
			
	} else {
	if {""!=$line} {
		puts "��������:\[$line\]"
	} else {
		return
	} 
	
	# �رյ�ǰ����ִ�е�Server
		if { [string compare [lindex $line 0] "CloseServer"] == 0 } { 	
			# Prevent new connections  			
			# Existing connections stay open
			puts $sock "ִ�гɹ�.ִ������:CloseServer" 
			puts "��������: $echo(addr,$sock)�ر�"
			close $echo(server)
			global stopServer
			set stopServer 1  
			
			return 		
		}
		
		# ִ�ж�ȡ����������
		if { [ catch { set result [eval $line] } msg ] } {
			set result [list -1 $msg]
			puts "FAIL:ִ��ʧ��.��������: $line ,������Ϣ:$msg"
		}
		
		puts "ִ�н��:\{ $result \}\n"
		# ��������ȡ����򷵻�result
		puts $sock $result
	}
}

#�����������˵ĳ��� 
#ʹ�÷���:GR_Server 2012 
proc GR_Server {port} {
	global echo 
	set echo(server) [socket -server EchoAccept $port]  

	#���˳�
	global stopServer
	vwait stopServer  
	return $echo(server)
}
