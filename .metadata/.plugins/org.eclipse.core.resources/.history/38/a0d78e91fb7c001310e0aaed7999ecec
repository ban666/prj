
package provide RCClient 1.0 

#引入ITCL库
catch {package require Itcl}
catch {namespace import -force itcl::*}   
#调试
set Debug  0  

 

proc Wrong { args } {
	puts <0,0,0>(错误信息:)$args<END>
	return 0
}  


class GR_Client {
    # socket主机
    private variable m_host
    private variable m_port
    private variable ChannelID 
    
    #获得socket通道
    method GetChannelId {} {
	    # 若channel未建立，则建立socket 
	    if {-1 == $ChannelID} {
		if {[catch { 
			set ChannelID [socket $m_host $m_port]
			#设置为按行收发 
			    fconfigure $ChannelID -buffering line
		} msg]} { 
			    Wrong "无效的服务器:主机:$m_host 端口:$m_port,错误信息:\n $msg"	
			    return ""	    	 
		    }    		
	    }
	    return $ChannelID
    }
    
    #创建一个对象，获得其socket通道
    constructor {host port} {  
	    set m_host $host
	    set m_port $port
	    set ChannelID "-1" 
    }  
    
    #store the variable in the remote Server
    
    
    #在服务器上执行一个命令,type!=0时,等待并输出远程执行结果 
    # 默认等待执行结果
    # expectResult 函数执行预期结果(根据返回列表第一个元素判断),"null"表示不判定
    method GR_eval { str {type 1} {expectResult "null"}} {
			  
		set ChannelId [GetChannelId]    
		
		if {$ChannelId == ""} { return }   
	    
		puts "发送命令: \[ $str \]"
			      
	    if { [ catch {puts $ChannelId "$str"} msg ] } {    
		    Wrong "发送命令$str 失败:$msg" 
		    return
	    }
	    #如果不希望等待返回运行结果
	    if {$type == 0} { 
		close $ChannelID
		    set ChannelID "-1"
		    return
	    }
		
		#　阻塞等待知道获取结果
	    gets $ChannelId result
 	
	    # 关闭socket连接(为了避免中间网络出现掉线,而不能继续运行的情况)
	    close $ChannelID
	    set ChannelID "-1"

	    if {[string match "FAIL:*" $result ]==1}  { 
		    return FAIL
	    } else { 
			# 打印执行命令的返回信息
			puts "返回结果: \{ $result \}\n"
			
			if {[regexp -nocase {null} $expectResult]} {
				return $result
			} else {
				set resultArr(ok) "1" ; set resultArr(fail) "0"
				if {$resultArr([string tolower $expectResult]) != [lindex $result 0]} {
					set funcName [lindex $str 0]
					set failMsg "Fail @funcName; Reason:[lindex $result 2];"
					lappend ::Global::gaAWReason $failMsg
					
					return -code error $failMsg
				}
			}
	    }
    }
    }

