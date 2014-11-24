# -*- coding: utf-8 -*-   
# -*- encoding=utf-8 -*-
import urllib  
import urllib2
import sys  
import cookielib  
from info import ip
from info import host
from info import pwd
from info import base_url
from time import sleep
from urllib2 import URLError  

#head
ExploereHEADERS = {'Accept':'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8',
'Accept-Encoding':'gzip,deflate,sdch',
'Accept-Language':'zh-CN,zh;q=0.8',
'Connection':'keep-alive',
'Host':host,
'Referer':base_url+'login.jsp'
}   

#设置cookie  
cj = cookielib.CookieJar()  
opener = urllib2.build_opener(urllib2.HTTPCookieProcessor(cj))  
# 安装cookie  
urllib2.install_opener(opener)   

#发送Post并获取Response
def GetWeb(url,values,method ='post'):  
	data = urllib.urlencode(values).encode('utf-8')
	if method == 'post':  
		url = url+'?'+data  
		req = urllib2.Request(url, headers = ExploereHEADERS)  
	else:  
		req = urllib2.Request(url, data,headers = ExploereHEADERS)  
	response = urllib2.urlopen(req)  
	the_page = response.read()  
	response.close()
	return the_page; 
#处理参数
temp=sys.argv[2]

uri2 = base_url+sys.argv[1]
params2 = temp.split(',')
list=[]
for i in params2:
	i=i.replace('@',',')
	list.append(i)

dicta=dict(map(lambda x: x.split(':', 1), list))
print type(uri2)
print type(dicta)
'''uri1 = base_url+'Login'
params1 = {
'username':'admin',
'password':'admin'
}; 
a=GetWeb(uri1,params1)
'''
try:
	b=GetWeb(uri2,dicta)
	#打印Response
	print(b)
except Exception,e:
	print e