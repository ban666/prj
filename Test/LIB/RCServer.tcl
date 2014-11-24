#引入ITCL库
catch {package require Itcl}
catch {namespace import -force itcl::*}
 
proc Wrong { args } {
	puts <0,0,0>"(Error Message:)$args"<END>
	return 0
}

#服务器回应函数 
#使用fileevent等待客户数据，使用fconfigure调整网络socket的缓冲区方式。
proc EchoAccept {sock addr port} { 
	#记录客户端信息  
	#puts "Accept $sock form $addr port $port"  
	after 0 
	set channelID   $sock
	set clientIP  $addr
	set clientPort $port
	global echo  
	set echo(addr,$sock) [list $addr $port]   ;#出错时，指示SOCK的PORT和IP
	
	#缓冲区类型为按行处理 
	fconfigure $sock -buffering line
 
	
	#当缓冲区满足buffering条件时调用绑定函数
	fileevent $sock readable [list Echo $sock] 
}

#当缓冲区满足buffering条件时调用
proc Echo {sock} {	
	global echo
	set currPath [info script] 
	set path [file dirname $currPath]   
			
	if { [eof $sock] || [catch {gets $sock line}] } {  	
		close $sock  		
		unset echo(addr,$sock) ;  		
			
	} else {
	if {""!=$line} {
		puts "接收命令:\[$line\]"
	} else {
		return
	} 
	
	# 关闭当前正在执行的Server
		if { [string compare [lindex $line 0] "CloseServer"] == 0 } { 	
			# Prevent new connections  			
			# Existing connections stay open
			puts $sock "执行成功.执行命令:CloseServer" 
			puts "服务器被: $echo(addr,$sock)关闭"
			close $echo(server)
			global stopServer
			set stopServer 1  
			
			return 		
		}
		
		# 执行读取到的命令行
		if { [ catch { set result [eval $line] } msg ] } {
			set result [list -1 $msg]
			puts "FAIL:执行失败.出错命令: $line ,错误信息:$msg"
		}
		
		puts "执行结果:\{ $result \}\n"
		# 若期望获取结果则返回result
		puts $sock $result
	}
}

#开启服务器端的程序： 
#使用方法:GR_Server 2012 
proc GR_Server {port} {
	global echo 
	set echo(server) [socket -server EchoAccept $port]  

	#不退出
	global stopServer
	vwait stopServer  
	return $echo(server)
}
