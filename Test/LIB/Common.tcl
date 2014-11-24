#-----------------------
#���ܣ��ύ���Խ�������Ա���
#TestCaseNo:TC001
#Result��1,0
#msg:������Ϣ
#Author��liaoben
#example: SetTestcaseResult Testcase_001 1
#--------------------------
proc SetTestcaseResult { TestCaseNo {Result 1} {msg ""}} {
    set File $::g_File
    #open file
    set ID [open $File RDWR]
    if {0==[regexp "file*" $ID]} {
	puts "���ļ�ʧ��"
	return [list 0 {} {}]
    }
    #Go to the end
    read $ID
    set NowTime [clock format [clock seconds] -format "%Y��%m��%d�� %H:%M:%S"]
    puts $ID "\n$NowTime �������\:$TestCaseNo\n$NowTime\ ���Խ��\:$Result\n$NowTime �ű�����\:[info script]\n"
    
    puts $ID "\n"

    close $ID
    return [list 1 {} {}]
}

proc GetResult {} {
    set File $::g_File
    #open file
    set ID [open $File RDWR]
    if {0==[regexp "file*" $ID]} {
	puts "���ļ�ʧ��"
	return [list 0 {} {}]
    }
    #Go to the end
    set total 0
    set pcount 0
    set fcount 0	
    set content [split [read $ID] \n]
    foreach line $content {
	 if {[regexp "���Խ��:PASS" $line]} {
	 	 incr pcount
		 incr total
	 } elseif {[regexp "���Խ��:FAIL" $line]} {
			   incr fcount
			  incr total
	 } 
	    
    }
    set NowTime [clock format [clock seconds] -format "%Y��%m��%d�� %H:%M:%S"]
   # puts $ID "\n$NowTime �������\:$TestCaseNo\n$NowTime\ ���Խ��\:$Result\n$NowTime �ű�����\:[info script]\n"
    set Passrate [format "%.3f" [expr double($pcount)/$total]]
    ShowMessage "���β��Խ����TestCase��$total Pass:$pcount Fail:$fcount ͨ���ʣ�[expr $Passrate*100]%"

    close $ID
    return [list 1 {} {}]
}

#-----------------------
#���ܣ���ӡ���Խ��
#TestCaseNo:TC001
#Result��1,0
#msg:������Ϣ
#Author��liaoben 
#example: SetTestcaseResult Testcase_001 1
#--------------------------
proc PrintScriptResult {result} {
	if {$result==0} {
		ShowMessage "��������ִ�н����Failed"
	} else {
		ShowMessage "��������ִ�н����Pass"	
	}
		
}

#-----------------------
#���ܣ���ӡ���Խ��
#Author��liaoben 
#example: ClearResult
#--------------------------
proc ClearResult {} {
    set File $::g_File
    #open file
    set ID [open $File w+]
    return [list 1 {} {}]
}    

#-----------------------
#���ܣ�����PING����
#ip:����PING���Ե�IP
#option��Ĭ��Ϊ�� ��ѡ����Ϊcmd�¿�ѡ��������-c 2�ȵ�
#����ֵΪ{A B {}},AΪ�Ƿ�PINGͨ״ֵ̬��BΪ�����ʣ�0��Ϊ�޶���
#Author��liaoben 
#example: Pingtest www.baidu.com
#--------------------------
proc Pingtest {ip {option ""}} {
	if {[string equal "" $option]} {
        puts "ִ�����\[ping $ip\]"
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
		puts "ִ�����\[ping $ip $option\]"
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
#���ܣ���ȡ�������������Ϣ
#Netcard����Ӧ�������ƣ��籾������
#����ֵ��{A B {}} BΪһ��LIST [IP MAC DNS]
#Author��liaoben 
#example: GetNetcardInfo ��������
#--------------------------
proc GetNetcardInfo {Netcard} {
set Content [exec ipconfig /all]

regexp "$Netcard:(.*)��̫��" $Content temp 
set mac [string range [lindex [split $temp \n] 4] 35 end]
set ip [string range [lindex [split $temp \n] 8] 37 end-5]
set gateway [string range [lindex [split $temp \n] 10] 35 end]
set mask [string range [lindex [split $temp \n] 9] 35 end]
set dns [string range [lindex [split $temp \n] 13] 36 end]
return [list 1 [list $ip $mac $dns] {}]
}

#-----------------------
#���ܣ���ȡCFG�ļ�����
#��ע���˺������ڽű���ʼʱ��ȡCFG�ļ�����
#Author��liaoben 
#example: GetCfg
#--------------------------
proc GetCfg {} {
	set scrirptname [info script]
        regsub ".app.tcl" $scrirptname ".cfg" configFile
	#�������ļ� 
	
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
	
	#�������ļ� 
	
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
#���ܣ�����ǰʱ���ӡ���
#args: ��ӡ��Ϣ
#Author��liaoben 
#example: ShowMessage "Hello,world!"
#--------------------------
proc ShowMessage {args} {
	set NowTime [clock format [clock seconds] -format "%Y��%m��%d�� %H:%M:%S"]
	set list "" 
	regsub "\{" $args "" args
	regsub "\}" $args "" args
	
	puts "$NowTime:$args"
}

#-----------------------
#���ܣ���ȡ��ǰʱ��
#��ӡ��ʽΪ2014��2��11��10:25:18
#Author��liaoben 
#example: GetTime
#--------------------------
proc GetTime {} {
	set NowTime [clock format [clock seconds] -format "%Y��%m��%d�� %H:%M:%S"]
	return $NowTime
}


proc Timerange {times} {
set iHour [expr $times/3600]
set iMin [expr ($times-$iHour*3600)/60]
set iSen [expr $times-$iHour*3600-$iMin*60]
return [list $iHour $iMin $iSen]
}

#ð������
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
