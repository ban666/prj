set ::g_sship 192.168.13.13
set ::g_File [string range [info script] 0 [string first t\\Global [info script]]]\\Report\\TestResult.txt; #结果文件保存位置
set ::g_pro_location [string range [info script] 0 [string first t\\Global [info script]]] ; 
set ::g_pro_location1 [string range [info script] 0 [string first t\\Global [info script]]] ; #工程存放位置
set ::g_python "[string trimright $::g_pro_location1 \Test]ssh\\src\\Python27\\Scripts" ; #python脚本存放位置
set ::g_web_python "[string trimright $::g_pro_location1 \Test]web_py\\src" ; #python脚本存放位置
set ::g_post_python "[string trimright $::g_pro_location1 \Test]web_py\\src\\HttpPost.py";#HttpPost脚本位置
