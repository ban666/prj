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
	

			  return $cmd
			   
		   }

set down 40000
set times 50
for {set k 1} {$k<=$times} {incr k} {
		puts [AddChannel chid $k chpid [expr $k-1] down $down max_down $down ]
	
		incr down -1
	}
	
	
	
	
	
	
	