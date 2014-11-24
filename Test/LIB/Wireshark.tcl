namespace eval Tshark {
   
}

#-----------------------
#���ܣ�ץ��
#interface:�����ӿ�
#filter��ץ�����˱������ͣ�tcp,udp,port==53��
#SLocation:���ı���λ�ã�e:\\test\\1.txt��
#duration:ץ��ʱ�䣨10����λΪs
#tsharkpath��wireshark��װ·��
#V���Ƿ�չ������
#Author��liaoben 
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
	puts "\[ִ�����$cmd\]"
	set bat "e:\\test\\Test.bat"
	Makebat $cmd "e:\\test\\Test.bat"
	Makebat "start call $bat\nexit" "e:\\test\\Start.bat"
	catch {exec $bat} msg  
	puts $msg
	cd $dir
	return 1
}

#-----------------------
#���ܣ����ı����Ƿ����ƶ��ؼ���
#filter��ץ�����˹ؼ���
#file:���ı���λ�ã�e:\\test\\1.txt��
#Author��liaoben 
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
#���ܣ�����bat�ļ�
#cmd������ָ��
#file:�ļ�λ�ã�e:\\test\\1.txt��
#Author��liaoben 
#--------------------------
proc Makebat {cmd file} {
      set ChannleId [open $file w+]
      puts $ChannleId $cmd
      flush $ChannleId
      close $ChannleId
	return 1
}


