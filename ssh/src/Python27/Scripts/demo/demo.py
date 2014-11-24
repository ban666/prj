# -*- coding: utf-8 -*-   
import urllib  
import urllib2  
import cookielib  
import json

from urllib2 import URLError  


ExploereHEADERS = {'Accept':'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8',
'Accept-Encoding':'gzip,deflate,sdch',
'Accept-Language':'zh-CN,zh;q=0.8',
'Connection':'keep-alive',
'Host':'192.168.11.6:8443',
'Referer':'https://192.168.11.6:8443/login.jsp'
}   
#设置cookie  
cj = cookielib.CookieJar()  
opener = urllib2.build_opener(urllib2.HTTPCookieProcessor(cj))  
# 安装cookie  
urllib2.install_opener(opener)   

def GetWeb(url,values,method ='get'):  
	#data = urllib.urlencode(values) #数据编码  
	data=values
	print(data)
	if method == 'get':  
		url = url+'?'+data  
		req = urllib2.Request(url, headers = ExploereHEADERS)  
	else:  
		req = urllib2.Request(url, data,headers = ExploereHEADERS)  
	response = urllib2.urlopen(req)  
	the_page = response.read()  
	response.close() #不用了就关闭掉  
	return the_page; 

uri2 = 'https://192.168.11.6:8443/AddUser'
params2 = {
'ugid':2,'username':'测试','userip':'2.2.2.2'
};
uri1 = 'https://192.168.11.6:8443/Login'
params1 = {
'username':'admin',
'password':'admin'
}; 
a=GetWeb(uri1,params1)
c='rows=20&type=auth&page=1'
b=GetWeb(uri2,params2)
print(b)
c=json.loads(b)
print c