#!/bin/sh
# ssh.tcl \
exec tclsh "$0" ${1+"$@"}

#ͨ��python�ű�ssh��½���豸��ִ������
namespace eval Ssh {
	
}


#-----------------------
#���ܣ�����ǰʱ���ӡ���
#args: ��ӡ��Ϣ
#Author��liaoben 
#example: ShowMessage "Hello,world!"
#--------------------------
proc SshPs {file {cmd ps} } {
	puts "ִ�����\[$cmd\]"
    if	{[catch {exec python.exe $file $cmd} msg]} {
	    return [list 0 $msg {}]
        } else {
		regexp {.*\[(.*)\].*} $msg whole rmsg
		return [list 1 $msg {}]
        }
     
}


proc SshPing {file ip {count 4} {size 64} {timeout 3.0} {interface eth0}} {
	set cmd "sh ping.sh $ip $count $size $timeout $interface"
	puts "ִ�����\[$cmd\]"
    if	{[catch {exec python.exe $file $cmd} msg]} {
	    return [list 0 $msg {}]
	} 
	regexp {.*\[(.*)\].*} $msg whole rmsg
        set c [split $rmsg ,]
	foreach line $c {
	puts $line
	}
        if {[regexp -nocase ttl $rmsg]} {
	regexp {([0-9])% packet loss} $rmsg whole rate
	return [list 1 $rate {}]
        } elseif {[regexp -nocase unknown $rmsg]} {
		return [list 0 $rmsg {}]
        } else {
	return [list 0 {} {}]
        }
     
}

proc WanWebStart {} {
	set cmd "sh login_control.sh wanweb yes"
	set file "$::g_python\\SShping.py"
	puts "ִ�����\[$cmd\]"
    if	{[catch {exec python.exe $file $cmd} msg]} {
	    puts $msg
	    return [list 0 $msg {}]
	} 
	
	
	return [list 1 {} {}]
	}


proc Timecheck {arg} {
	set cmd "cp $arg /etc/localtime; date +%:::z"
	set file "$::g_python\\SShTimezone.py"
	puts "ִ�����\[$cmd\]"
    if	{[catch {exec python.exe $file $cmd} msg]} {
	    puts $msg
	    return [list 0 $msg {}]
	} 
	set temp [lindex [split $msg \n] 1]
	regexp {\['(.*)\\n'\]} $temp d e
	
	return $e
	}
  
proc WanWebStop {} {
	set cmd "sh login_control.sh wanweb no"
	set file "$::g_python\\SShping.py"
	puts "ִ�����\[$cmd\]"
    if	{[catch {exec python.exe $file $cmd} msg]} {
	    puts $msg
	    return [list 0 $msg {}]
	} 
	
	
	return [list 1 {} {}]
	}
     


proc AddChannel {args} {
	array set list {chid "1"\
                  wan "eth1"\
	          lan "eth2"\
		  chpid "0"\
		  down "40000"\
	          max_down "40000"\
	          up "40000"\
	          max_up "40000"\
		  prio "1"\
		  users "192.168.100.2,192.168.100.3"\
		  apps "11,30-35"\
		  single_down "0"\
	          single_up "0"\
		  t_f1 "08:00:00"\
		  t_t1 "11:59:59"\
		  t_f2 "14:00:00"\
		  t_t2 "18:00:00"\
		  weekday "Mon,Tue,Wed,Thu,Fri,Sat"\
		  enable "1"}
	if {[regexp  {{(.*)}} $args wholes list2 ]} {
		 foreach {i j} $list2 {
			 set list($i) $j
		 }
		}	
		foreach {i j} $args {
				set list($i) $j
			}
 set cmd "./limitClient --add $list(chid) $list(wan) $list(lan) $list(chpid) $list(down) $list(max_down) $list(up) $list(max_up) $list(prio) $list(users) $list(apps) $list(single_down) $list(single_up) $list(t_f1) $list(t_t1) $list(t_f2) $list(t_t2) $list(weekday) $list(enable)"	
	puts "ִ�����\[$cmd\]"
	set file "$::g_python\\temp.py"
	if	{[catch {exec python.exe $file $cmd} msg]} {
		   return [list 0 $msg {}]
	       } 
	       regexp {.*\[(.*)\].*} $msg whole rmsg
	puts $msg
	if {[regexp {limit cmd execute success} $msg]} { 
			   puts "ͨ�����óɹ�"
			   return [list 1]
		   } else {
			  puts "ͨ������ʧ��"
			  return [list 0]
			   
		   }
} 


proc ChgChannel {args} {
	array set list {chid "1"\
		  wan "eth1"\
		  lan "eth2"\
		  chpid "0"\
		  down "40000"\
		  max_down "40000"\
		  up "40000"\
		  max_up "40000"\
		  prio "1"\
		  users "192.168.100.2,192.168.100.3"\
		  apps "11,30-35"\
		  single_down "0"\
		  single_up "0"\
		  t_f1 "08:00:00"\
		  t_t1 "11:59:59"\
		  t_f2 "14:00:00"\
		  t_t2 "18:00:00"\
		  weekday "Mon,Tue,Wed,Thu,Fri,Sat"\
		  enable "1"}
	if {[regexp  {{(.*)}} $args wholes list2 ]} {
		 foreach {i j} $list2 {
			 set list($i) $j
		 }
		}	
		foreach {i j} $args {
				set list($i) $j
			}
 set cmd "./limitClient --chg $list(chid) $list(wan) $list(lan) $list(chpid) $list(down) $list(max_down) $list(up) $list(max_up) $list(prio) $list(users) $list(apps) $list(single_down) $list(single_up) $list(t_f1) $list(t_t1) $list(t_f2) $list(t_t2) $list(weekday) $list(enable)"	
	puts "ִ�����\[$cmd\]"
	set file "$::g_python\\temp.py"
	if	{[catch {exec python.exe $file $cmd} msg]} {
		   return [list 0 $msg {}]
	       } 
	       regexp {.*\[(.*)\].*} $msg whole rmsg
	
	if {[regexp {limit cmd execute success} $msg]} { 
			   puts "ͨ�����óɹ�"
			   return [list 1]
		   } else {
			  puts "ͨ������ʧ��"
			  return [list 0]
			   
		   }
} 

proc DelChannel {args} {
	array set list {chid "1"\
		  wan "eth1"\
		  lan "eth2"\
		  chpid "0"}
	if {[regexp  {{(.*)}} $args wholes list2 ]} {
	 foreach {i j} $list2 {
		 set list($i) $j
	 }
	}	
	foreach {i j} $args {
			set list($i) $j
		}
 set cmd "./limitClient --del $list(chid) $list(wan) $list(lan) $list(chpid)"	
	puts "ִ�����\[$cmd\]"
	set file "$::g_python\\temp.py"
	if	{[catch {exec python.exe $file $cmd} msg]} {
		   return [list 0 $msg {}]
	       } 
	
	   if {[regexp {limit cmd execute success} $msg]} { 
	           puts "ͨ��ɾ���ɹ�"
		   return [list 1]
	   } else {
		  puts "ͨ��ɾ��ʧ��"
		  return [list 0]
		   
	   }
} 

proc GetChStatus {} {
	
 set cmd "./limitClient --ls"	
	puts "ִ�����\[$cmd\]"
	set file "$::g_python\\temp.py"
	if	{[catch {exec python.exe $file $cmd} msg]} {
		   return [list 0 $msg {}]
	       } 
	   if {[regexp {limit cmd execute success} $msg]} { 
		   puts "ɾ���ɹ�"
		   return [list 1 $msg {}]
	   } else {
		  puts "ɾ��ʧ��"
		  return [list 0 $msg {}]
		   
	   }
} 

