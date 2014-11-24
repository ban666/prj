namespace eval Tshark {
   
}

#-----------------------
#功能：抓包
#interface:网卡接口
#filter：抓包过滤报文类型（tcp,udp,port==53）
#SLocation:报文保存位置（e:\\test\\1.txt）
#duration:抓包时间（10）单位为s
#tsharkpath：wireshark安装路径
#V：是否展开报文
#Author：liaoben 
#example: Capture 3 tcp "e:\\test\\1.txt" 10 "c:\\program files\\wireshark"
#--------------------------
proc Capture {interface filter SLocation duration tsharkpath {V 0}} {
     set dir [pwd]
     cd $tsharkpath
	puts [pwd]
	if {$V==1} {
	set cmd [list tshark -i $interface -f $filter -a duration:$duration -V > $SLocation]
	}
	set cmd "tshark -i $interface -f $filter -a duration:$duration > $SLocation"
	puts "\[执行命令：$cmd\]"
	set bat "e:\\test\\Test.bat"
	Makebat $cmd "e:\\test\\Test.bat"
	Makebat "start call $bat\nexit" "e:\\test\\Start.bat"
	catch {exec $bat} msg  
	puts $msg
	cd $dir
	return 1
}

#-----------------------
#功能：查阅报文是否含有制定关键字
#filter：抓包过滤关键字
#file:报文保存位置（e:\\test\\1.txt）
#Author：liaoben 
#--------------------------
proc Exsitcheck {filter file} {
	set status 0
	set Getfile [open $file RDONLY]
	set Content [split [read $Getfile] \n]
	foreach line $Content {
	   if {[regexp $filter $line]} {
	      set status 1
	   }		
	}
	return $status
}

#-----------------------
#功能：创建bat文件
#cmd：发送指令
#file:文件位置（e:\\test\\1.txt）
#Author：liaoben 
#--------------------------
proc Makebat {cmd file} {
      set ChannleId [open $file w+]
      puts $ChannleId $cmd
      flush $ChannleId
      close $ChannleId
	return 1
}


