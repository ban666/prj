set ::g_sship 192.168.13.13
set ::g_File [string range [info script] 0 [string first t\\Global [info script]]]\\Report\\TestResult.txt; #����ļ�����λ��
set ::g_pro_location [string range [info script] 0 [string first t\\Global [info script]]] ; 
set ::g_pro_location1 [string range [info script] 0 [string first t\\Global [info script]]] ; #���̴��λ��
set ::g_python "[string trimright $::g_pro_location1 \Test]ssh\\src\\Python27\\Scripts" ; #python�ű����λ��
set ::g_web_python "[string trimright $::g_pro_location1 \Test]web_py\\src" ; #python�ű����λ��
set ::g_post_python "[string trimright $::g_pro_location1 \Test]web_py\\src\\HttpPost.py";#HttpPost�ű�λ��
