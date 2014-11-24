#-----------------------
#功能：提交测试结果到测试报告
#TestCaseNo:TC001
#Result：1,0
#msg:任意信息
#Author：liaoben
#example: SetTestcaseResult Testcase_001 1
#--------------------------
proc SetTestcaseResult { TestCaseNo {Result 1} {msg ""}} {
    set File $::g_File
    #open file
    set ID [open $File RDWR]
    if {0==[regexp "file*" $ID]} {
	puts "打开文件失败"
	return [list 0 {} {}]
    }
    #Go to the end
    read $ID
    set NowTime [clock format [clock seconds] -format "%Y年%m月%d日 %H:%M:%S"]
    puts $ID "\n$NowTime 用例编号\:$TestCaseNo\n$NowTime\ 测试结果\:$Result\n$NowTime 脚本名称\:[info script]\n"
    
    puts $ID "\n"

    close $ID
    return [list 1 {} {}]
}

proc GetResult {} {
    set File $::g_File
    #open file
    set ID [open $File RDWR]
    if {0==[regexp "file*" $ID]} {
	puts "打开文件失败"
	return [list 0 {} {}]
    }
    #Go to the end
    set total 0
    set pcount 0
    set fcount 0	
    set content [split [read $ID] \n]
    foreach line $content {
	 if {[regexp "测试结果:PASS" $line]} {
	 	 incr pcount
		 incr total
	 } elseif {[regexp "测试结果:FAIL" $line]} {
			   incr fcount
			  incr total
	 } 
	    
    }
    set NowTime [clock format [clock seconds] -format "%Y年%m月%d日 %H:%M:%S"]
   # puts $ID "\n$NowTime 用例编号\:$TestCaseNo\n$NowTime\ 测试结果\:$Result\n$NowTime 脚本名称\:[info script]\n"
    set Passrate [format "%.3f" [expr double($pcount)/$total]]
    ShowMessage "本次测试结果：TestCase：$total Pass:$pcount Fail:$fcount 通过率：[expr $Passrate*100]%"

    close $ID
    return [list 1 {} {}]
}

#-----------------------
#功能：打印测试结果
#TestCaseNo:TC001
#Result：1,0
#msg:任意信息
#Author：liaoben 
#example: SetTestcaseResult Testcase_001 1
#--------------------------
proc PrintScriptResult {result} {
	if {$result==0} {
		ShowMessage "测试用例执行结果：Failed"
	} else {
		ShowMessage "测试用例执行结果：Pass"	
	}
		
}

#-----------------------
#功能：打印测试结果
#Author：liaoben 
#example: ClearResult
#--------------------------
proc ClearResult {} {
    set File $::g_File
    #open file
    set ID [open $File w+]
    return [list 1 {} {}]
}    

#-----------------------
#功能：进行PING测试
#ip:进行PING测试的IP
#option：默认为空 可选参数为cmd下可选参数，如-c 2等等
#返回值为{A B {}},A为是否PING通状态值，B为丢包率，0则为无丢包
#Author：liaoben 
#example: Pingtest www.baidu.com
#--------------------------
proc Pingtest {ip {option ""}} {
	if {[string equal "" $option]} {
        puts "执行命令：\[ping $ip\]"
	set pingresult [catch {exec ping $ip} msg]
	puts $msg
	if {[regexp TTL $msg]} {
	set line [lindex [split $msg \n] end-2]
	set Lostrate [lindex [split $line {}] end-6]	
	set rate [expr 100-$Lostrate]
	return [list 1 $Lostrate {}]	
	}
		return [list 0 {} {}]
	} else {
		puts "执行命令：\[ping $ip $option\]"
	set pingresult [catch {eval "exec ping $ip $option"} msg]	
	puts $msg
	if {[regexp TTL $msg]} {
		set line [lindex [split $msg \n] end-2]
		set Lostrate [lindex [split $line {}] end-6]	
		set rate [expr 100-$Lostrate]
		return [list 1 $Lostrate {}]	
		}
		return [list 0 {} {}]
	}
	
}

#-----------------------
#功能：获取本地网卡相关信息
#Netcard：对应连接名称，如本地连接
#返回值：{A B {}} B为一个LIST [IP MAC DNS]
#Author：liaoben 
#example: GetNetcardInfo 本地连接
#--------------------------
proc GetNetcardInfo {Netcard} {
set Content [exec ipconfig /all]

regexp "$Netcard:(.*)以太网" $Content temp 
set mac [string range [lindex [split $temp \n] 4] 35 end]
set ip [string range [lindex [split $temp \n] 8] 37 end-5]
set gateway [string range [lindex [split $temp \n] 10] 35 end]
set mask [string range [lindex [split $temp \n] 9] 35 end]
set dns [string range [lindex [split $temp \n] 13] 36 end]
return [list 1 [list $ip $mac $dns] {}]
}

#-----------------------
#功能：读取CFG文件内容
#备注：此函数用于脚本开始时读取CFG文件内容
#Author：liaoben 
#example: GetCfg
#--------------------------
proc GetCfg {} {
	set scrirptname [info script]
        regsub ".app.tcl" $scrirptname ".cfg" configFile
	#打开配置文件 
	
	set err [catch {set fileid [open $configFile r]} errMsg]
	if {$err==1} { 
	puts"errMsg:$errMsg"
	return 0
	} 
	fconfigure $fileid -encoding gb2312
	set rowid 0
	seek $fileid 0 start
	set content [read $fileid]
	set line [split $content \n]    
	set data [lrange $line 1 end]  
	set cfgname [split [lindex $line 0] ,]
	set cfgnum [expr [llength $line]-1]   
	set datalength [llength [split [lindex $line 0] ,]]
	return [list $cfgnum $data $cfgname $datalength]
	}

proc ReadByLine {file} {
	
	#打开配置文件 
	
	set err [catch {set fileid [open $file r]} errMsg]
	if {$err==1} { 
	puts"errMsg:$errMsg"
	return 0
	} 
	set rowid 0
	seek $fileid 0 start
	set content [read $fileid]
	set line [split $content \n]  
	return $line
	}


#-----------------------
#功能：按当前时间打印输出
#args: 打印信息
#Author：liaoben 
#example: ShowMessage "Hello,world!"
#--------------------------
proc ShowMessage {args} {
	set NowTime [clock format [clock seconds] -format "%Y年%m月%d日 %H:%M:%S"]
	set list "" 
	regsub "\{" $args "" args
	regsub "\}" $args "" args
	
	puts "$NowTime:$args"
}

#-----------------------
#功能：获取当前时间
#打印格式为2014年2月11日10:25:18
#Author：liaoben 
#example: GetTime
#--------------------------
proc GetTime {} {
	set NowTime [clock format [clock seconds] -format "%Y年%m月%d日 %H:%M:%S"]
	return $NowTime
}


proc Timerange {times} {
set iHour [expr $times/3600]
set iMin [expr ($times-$iHour*3600)/60]
set iSen [expr $times-$iHour*3600-$iMin*60]
return [list $iHour $iMin $iSen]
}

#冒泡排序
proc maopao {list} {
 set listlength [llength $list]
 for {set i 0} {$i<$listlength} {incr i} {
  for {set j [expr {$i+1}]} {$j<$listlength} {incr j} {
   set x [lindex $list $i]
   set y [lindex $list $j]
   if {[lindex $list $i]>[lindex $list $j]} {
    set list [lreplace $list $i $i $y]
    set list [lreplace $list $j $j $x]
   }
  }
 }
 return $list
}
