set cur_dir [pwd]  
set dir_test $cur_dir/tests set dir_sim  $cur_dir/sim   
set path ""  
proc filesearch {startdir filename} {  
	global path  
	set curdir [pwd]  
	cd $startdir  
	foreach match [glob -nocomplain -- $filename] {  
		puts $startdir/$match  lappend path $startdir   
		
	}   
	foreach file [glob -nocomplain *] {   
		if [file isdirectory $file] {     
			filesearch [file join $startdir $file] $filename;    
			
		}  
		
	} 
	cd $curdir 
	
}     
filesearch d:/prj_fpga/tests start.tcl 
puts $path      
#ͨ��TK�����Է����ʵ�֣����ӻ��ĳ��� 
set filename caselist.txt wm minsize . 200 100 #wm title ."text"  button .b1 -text "start" -width 15 -command "set flag 1;" button .b2 -text "exit" -width 15 -command "exit" 
pack .b1 .b2 -padx 5 -pady 5   
vwait flag   
#ͨ��tcl��װ�ĺ���ʵ��linux������windows����ʶ�𣬴Ӷ����ò�ͬ��ִ�д������  
if {$tcl_platform(platform) == "windows"} {  
	for {set i 0} {$i < [llength $path]} {incr i} {    
		set case_path [lindex $path $i]    
		exec D:/Modeltech_6.0/win32/modelsim.exe -do "cd  $case_path;source ../../serial_exec.tcl;"    
		
	} 
	
} else { 
	for {set i 0} {$i < [llength $path]} {incr i} {   
		set case_path [lindex $path $i]    
		exec modlsim  -do "source serial_exec.tcl;cd $case_path"   
		
	} 
	
}  

�� vlib work  vmap work ../../work;  
vlog ../../rtl/*.v; vlog ../../bfm/*.v;  
vlog ./test.v  
vsim -coverage -wlf 
vsim.wlf work.divtb #do wave.do; 
run 5ms;  
quit �Cf 