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
#GetWeb(abc.php,"a":"1","b":"2")
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

def HttpPost(url,values):
    global base_url
    url2 = base_url+url
    values2 = values.split(',')
    list=[]
    for i in values2:
        i=i.replace('@',',')
        list.append(i)
    dicta=dict(map(lambda x: x.split(':', 1), list))
    try:
        result = GetWeb(url2,dicta)
    except Exception,e:
        result = e
    finally:
        return result
    
