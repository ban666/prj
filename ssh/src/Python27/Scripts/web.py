# -*- coding:gb2312 -*-
from selenium import webdriver
from info import ip
from info import pwd
from info import base_url
from time import sleep


def Login (base_url,username='admin',password='admin'):
    driver = webdriver.Firefox()
    driver.implicitly_wait(20)
    base_url = base_url
    driver.get(base_url)
    driver.find_element_by_id("username").clear()
    driver.find_element_by_id("username").send_keys(username)
    driver.find_element_by_id("password").clear()
    driver.find_element_by_id("password").send_keys(password)
    driver.find_element_by_id("submit").click()
    driver.find_element_by_id("quit").click()
    driver.find_element_by_css_selector("div.messager-button > a.l-btn > span.l-btn-left").click()
    print 'Login success'
    driver.quit()

def TimeGroupAdd(base_url,timename='Autotest',timedesc='Autotest',t1='09:00:00',f1='12:00:00',t2='14:00:00',f2='18:00:00'):
  try:  
    driver = webdriver.Firefox()
    driver.implicitly_wait(20)
    base_url = base_url
    driver.get(base_url)
    driver.find_element_by_id("username").clear()
    driver.find_element_by_id("username").send_keys("admin")
    driver.find_element_by_id("password").clear()
    driver.find_element_by_id("password").send_keys("admin")
    driver.find_element_by_id("submit").click()
    print("Login Success\n")
    driver.implicitly_wait(5)
             
    
    driver.find_element_by_id("n2").click()
    driver.implicitly_wait(5)

    driver.find_element_by_link_text(u"ʱ����").click()
    driver.implicitly_wait(5)
            
    ''''Add TimeGroup Rule''' 
    driver.find_element_by_id("btn_add").click();
    driver.implicitly_wait(5)
    driver.find_element_by_id("timename").clear();
    driver.find_element_by_id("timename").send_keys(timename);
    driver.find_element_by_id("timedesc").clear();
    driver.find_element_by_id("timedesc").send_keys(timedesc); 
    driver.find_element_by_id("from1").clear();
    driver.find_element_by_id("from1").send_keys(t1);
    driver.find_element_by_id("to1").clear();
    driver.find_element_by_id("to1").send_keys(f1);
    driver.find_element_by_id("from2").clear();
    driver.find_element_by_id("from2").send_keys(t2);
    driver.find_element_by_id("to2").clear();
    driver.find_element_by_id("to2").send_keys(f2);
    driver.implicitly_wait(5);
            
    driver.find_element_by_xpath("id('dlg_btn_timeAdd')/a[1]").click();
    driver.implicitly_wait(5);
            
    sleep(3)
    driver.find_element_by_id("quit").click()
    driver.find_element_by_css_selector("div.messager-button > a.l-btn > span.l-btn-left").click()
    print("TimeGroup Add Success\n");
    driver.quit()
    return 1
    
  except:
     print("TimeGroup Add Failed\n");
     driver.quit()
     return 0
   
def TimeGroupEdit(base_url,timename='Autotest',timedesc='Autotest',t1='09:00:00',f1='12:00:00',t2='14:00:00',f2='18:00:00'):
  try:
    driver = webdriver.Firefox()
    driver.implicitly_wait(20)
    base_url = base_url
    driver.get(base_url)
    driver.find_element_by_id("username").clear()
    driver.find_element_by_id("username").send_keys("admin")
    driver.find_element_by_id("password").clear()
    driver.find_element_by_id("password").send_keys("admin")
    driver.find_element_by_id("submit").click()
    print("Login Success\n")
    driver.implicitly_wait(5)
             
    
    driver.find_element_by_id("n2").click()
    driver.implicitly_wait(5)

    driver.find_element_by_link_text(u"ʱ����").click()
    driver.implicitly_wait(5)      
    ''''Edit TimGroup Rule'''           
    driver.find_element_by_xpath("//tr[@id='datagrid-row-r3-2-1']/td[2]/div").click()
    driver.find_element_by_id("btn_edit").click();
    driver.implicitly_wait(5);
            
    driver.find_element_by_id("timename").clear();
    driver.find_element_by_id("timename").send_keys(timename);
    driver.find_element_by_id("timedesc").clear();
    driver.find_element_by_id("timedesc").send_keys(timedesc); 
    driver.find_element_by_id("from1").clear();
    driver.find_element_by_id("from1").send_keys(t1);
    driver.find_element_by_id("to1").clear();
    driver.find_element_by_id("to1").send_keys(f1);
    driver.find_element_by_id("from2").clear();
    driver.find_element_by_id("from2").send_keys(t2);
    driver.find_element_by_id("to2").clear();
    driver.find_element_by_id("to2").send_keys(f2);
    driver.implicitly_wait(5);
            
    driver.find_element_by_xpath("id('dlg_btn_timeAdd')/a[1]").click();
    driver.implicitly_wait(5);
    
    driver.find_element_by_id("quit").click()
    driver.find_element_by_css_selector("div.messager-button > a.l-btn > span.l-btn-left").click()        
    print("TimeGroup Edit Success\n");
    driver.quit()
    return 1
  except:
      driver.quit()
      return 0
    
def TimeGroupDel(base_url):
  try:
    driver = webdriver.Firefox()
    driver.implicitly_wait(20)
    base_url = base_url
    driver.get(base_url)
    driver.find_element_by_id("username").clear()
    driver.find_element_by_id("username").send_keys("admin")
    driver.find_element_by_id("password").clear()
    driver.find_element_by_id("password").send_keys("admin")
    driver.find_element_by_id("submit").click()
    print("Login Success\n")
    driver.implicitly_wait(5)
    
    driver.find_element_by_id("n2").click()
    driver.implicitly_wait(5)

    driver.find_element_by_link_text(u"ʱ����").click()
    sleep(3)                            
    '''Del Config'''
    driver.find_element_by_css_selector("//tr[@id='datagrid-row-r3-2-3']/td[2]/dive").click()
    driver.find_element_by_id("btn_del").click();
    driver.implicitly_wait(5);
            
    driver.find_element_by_xpath("/html/body/div[11]/div[2]/div[4]/a[1]/span/span").click();
    driver.implicitly_wait(5);
    
    driver.find_element_by_id("quit").click()
    driver.find_element_by_css_selector("div.messager-button > a.l-btn > span.l-btn-left").click()        
    print("TimeGroup Delete Success\n");
    
    driver.quit()
    return 1
  except:
      driver.quit()
      return 0
  
def SubnetAdd(base_url,ip,mask):
  try:
    driver = webdriver.Firefox()
    driver.implicitly_wait(20)
    base_url = base_url
    driver.get(base_url)
    driver.find_element_by_id("username").clear()
    driver.find_element_by_id("username").send_keys("admin")
    driver.find_element_by_id("password").clear()
    driver.find_element_by_id("password").send_keys("admin")
    driver.find_element_by_id("submit").click()
    print("Login Success\n")
    driver.implicitly_wait(5)
    
    driver.find_element_by_id("n2").click()
    driver.implicitly_wait(5);
    driver.find_element_by_link_text(u"��������").click()
    driver.implicitly_wait(5);
    
    ''''Add Subnet'''
    driver.find_element_by_id("int_btn_add").click()
    driver.find_element_by_id("subnet").clear()
    driver.find_element_by_id("subnet").send_keys(ip)
    driver.find_element_by_id("mask").clear()
    driver.find_element_by_id("mask").send_keys(mask)
    driver.find_element_by_xpath("id('dlg_btn_intranet')/a[1]").click();
    driver.implicitly_wait(5);
    driver.find_element_by_xpath("/html/body/div[8]/div[2]/div[4]/a/span/span").click();
    driver.implicitly_wait(5);
    
    driver.find_element_by_id("quit").click()
    driver.find_element_by_css_selector("div.messager-button > a.l-btn > span.l-btn-left").click()        
    print("Subnet Add Success\n");
    
    driver.quit()
    return 1
  except:
    driver.quit()
    return 0

def SubnetDel(base_url):
  try:
    driver = webdriver.Firefox()
    driver.implicitly_wait(20)
    base_url = base_url
    driver.get(base_url)
    driver.find_element_by_id("username").clear()
    driver.find_element_by_id("username").send_keys("admin")
    driver.find_element_by_id("password").clear()
    driver.find_element_by_id("password").send_keys("admin")
    driver.find_element_by_id("submit").click()
    print("Login Success\n")
    driver.implicitly_wait(5)
    
    driver.find_element_by_id("n2").click()
    driver.implicitly_wait(5);
    driver.find_element_by_link_text(u"��������").click()
    driver.implicitly_wait(5);
    
    ''''Del Subnet'''
    driver.find_element_by_name("ck").click()
    driver.find_element_by_id("int_btn_del").click()
    driver.implicitly_wait(5);
    driver.find_element_by_xpath("/html/body/div[8]/div[2]/div[4]/a[1]/span/span").click();
    sleep(5)
    driver.find_element_by_xpath("/html/body/div[8]/div[2]/div[4]/a/span/span").click();
    driver.implicitly_wait(5);
    driver.find_element_by_id("quit").click()
    driver.find_element_by_css_selector("div.messager-button > a.l-btn > span.l-btn-left").click()        
    print("Subnet Del Success\n");
    
    driver.quit()
    return 1
  except:
    driver.quit()
    return 0

def DhcpAdd(base_url,segment,mask,startip,endip):
  try:
    driver = webdriver.Firefox()
    driver.implicitly_wait(20)
    base_url = base_url
    driver.get(base_url)
    driver.find_element_by_id("username").clear()
    driver.find_element_by_id("username").send_keys("admin")
    driver.find_element_by_id("password").clear()
    driver.find_element_by_id("password").send_keys("admin")
    driver.find_element_by_id("submit").click()
    print("Login Success\n")
    driver.implicitly_wait(5)
    
    '''Add Dhcp'''
    driver.find_element_by_id("n5").click()
    driver.find_element_by_id("dis_DhcpDeploy").click()
    driver.find_element_by_id("btn_add").click()
    driver.find_element_by_id("segment").clear()
    driver.find_element_by_id("segment").send_keys(segment)
    driver.find_element_by_id("mask").clear()
    driver.find_element_by_id("mask").send_keys(mask)
    driver.find_element_by_id("startip").clear()
    driver.find_element_by_id("startip").send_keys(startip)
    driver.find_element_by_id("endip").clear()
    driver.find_element_by_id("endip").send_keys(endip)
    driver.find_element_by_id("submit").click()
    driver.find_element_by_xpath("/html/body/div[11]/div[2]/div[4]/a/span/span").click()
    
    driver.implicitly_wait(5);
    driver.find_element_by_id("quit").click()
    driver.find_element_by_css_selector("div.messager-button > a.l-btn > span.l-btn-left").click()        
    print("Dhcp Add Success\n");
    
    driver.quit()
    return 1
  except:
    driver.quit()
    return 0
      
def DhcpEdit(base_url,segment,mask,startip,endip):
  try:
    driver = webdriver.Firefox()
    driver.implicitly_wait(20)
    base_url = base_url
    driver.get(base_url)
    driver.find_element_by_id("username").clear()
    driver.find_element_by_id("username").send_keys("admin")
    driver.find_element_by_id("password").clear()
    driver.find_element_by_id("password").send_keys("admin")
    driver.find_element_by_id("submit").click()
    print("Login Success\n")
    driver.implicitly_wait(5)
    
    '''Add Dhcp'''
    driver.find_element_by_id("n5").click()
    driver.find_element_by_id("dis_DhcpDeploy").click()
    driver.implicitly_wait(5);
    driver.find_element_by_name("ck").click()
    driver.find_element_by_id("btn_edit").click()
    driver.find_element_by_id("segment").clear()
    driver.find_element_by_id("segment").send_keys(segment)
    driver.find_element_by_id("mask").clear()
    driver.find_element_by_id("mask").send_keys(mask)
    driver.find_element_by_id("startip").clear()
    driver.find_element_by_id("startip").send_keys(startip)
    driver.find_element_by_id("endip").clear()
    driver.find_element_by_id("endip").send_keys(endip)
    driver.find_element_by_id("submit").click()
    driver.find_element_by_xpath("/html/body/div[11]/div[2]/div[4]/a/span/span").click()
    
    driver.implicitly_wait(5);
    driver.find_element_by_id("quit").click()
    driver.find_element_by_css_selector("div.messager-button > a.l-btn > span.l-btn-left").click()        
    print("Dhcp Edit Success\n");
    
    driver.quit()
    return 1
  except:
    driver.quit()
    return 0


def DhcpDel(base_url):
  try:
    driver = webdriver.Firefox()
    driver.implicitly_wait(20)
    base_url = base_url
    driver.get(base_url)
    driver.find_element_by_id("username").clear()
    driver.find_element_by_id("username").send_keys("admin")
    driver.find_element_by_id("password").clear()
    driver.find_element_by_id("password").send_keys("admin")
    driver.find_element_by_id("submit").click()
    print("Login Success\n")
    driver.implicitly_wait(5)
    
    '''Del Dhcp'''
    driver.find_element_by_id("n5").click()
    driver.find_element_by_id("dis_DhcpDeploy").click()
    driver.implicitly_wait(5);
    driver.find_element_by_name("ck").click()
    driver.find_element_by_id("btn_del").click()
    driver.implicitly_wait(5);
    driver.find_element_by_xpath("/html/body/div[11]/div[2]/div[4]/a[1]/span/span").click()
    sleep(3)
    driver.find_element_by_xpath("/html/body/div[11]/div[2]/div[4]/a/span/span").click()
    driver.implicitly_wait(5);
    driver.find_element_by_id("quit").click()
    driver.find_element_by_css_selector("div.messager-button > a.l-btn > span.l-btn-left").click()        
    print("Dhcp Del Success\n");
    
    driver.quit()
    return 1
  except:
    driver.quit()
    return 0



def IP_MacAdd(base_url,ipbind,macbind):
  try:
    driver = webdriver.Firefox()
    driver.implicitly_wait(20)
    base_url = base_url
    driver.get(base_url)
    driver.find_element_by_id("username").clear()
    driver.find_element_by_id("username").send_keys("admin")
    driver.find_element_by_id("password").clear()
    driver.find_element_by_id("password").send_keys("admin")
    driver.find_element_by_id("submit").click()
    print("Login Success\n")
    driver.implicitly_wait(5)
    driver.find_element_by_id("n4").click();
    driver.implicitly_wait(5);
    driver.find_element_by_link_text(u"IP��MAC��").click()
    sleep(3);
    driver.find_element_by_id("btn_add").click();
    driver.implicitly_wait(5);
    driver.find_element_by_id("ip").clear();
    driver.find_element_by_id("ip").send_keys(ipbind);
    driver.find_element_by_id("mac").clear();
    driver.find_element_by_id("mac").send_keys(macbind);
    driver.find_element_by_id("submit").click();
    driver.implicitly_wait(5);
    driver.find_element_by_xpath("/html/body/div[8]/div[2]/div[4]/a/span/span").click();
    
        
    driver.find_element_by_id("quit").click()
    driver.find_element_by_css_selector("div.messager-button > a.l-btn > span.l-btn-left").click()  
    print("IP_Mac Add Success");
    
         
    driver.quit()
    return 1
  except:
    driver.quit()
    return 0

def IP_MacEdit(base_url,ipbind,macbind):
  try:
    driver = webdriver.Firefox()
    driver.implicitly_wait(20)
    base_url = base_url
    driver.get(base_url)
    driver.find_element_by_id("username").clear()
    driver.find_element_by_id("username").send_keys("admin")
    driver.find_element_by_id("password").clear()
    driver.find_element_by_id("password").send_keys("admin")
    driver.find_element_by_id("submit").click()
    print("Login Success\n")
    driver.implicitly_wait(5)
    driver.find_element_by_id("n4").click();
    driver.implicitly_wait(5);
    driver.find_element_by_link_text(u"IP��MAC��").click()
    sleep(3);
    driver.find_element_by_name("ck").click()
    driver.find_element_by_id("btn_edit").click();
    driver.implicitly_wait(5);
    driver.find_element_by_id("ip").clear();
    driver.find_element_by_id("ip").send_keys(ipbind);
    driver.find_element_by_id("mac").clear();
    driver.find_element_by_id("mac").send_keys(macbind);
    driver.find_element_by_id("submit").click();
    driver.implicitly_wait(5);
    driver.find_element_by_xpath("/html/body/div[8]/div[2]/div[4]/a/span/span").click();
    
        
    driver.find_element_by_id("quit").click()
    driver.find_element_by_css_selector("div.messager-button > a.l-btn > span.l-btn-left").click()  
    print("IP_Mac Edit Success");
    
         
    driver.quit()
    return 1
  except:
    driver.quit()
    return 0

def IP_MacUnbound(base_url):
  try:
    driver = webdriver.Firefox()
    driver.implicitly_wait(20)
    base_url = base_url
    driver.get(base_url)
    driver.find_element_by_id("username").clear()
    driver.find_element_by_id("username").send_keys("admin")
    driver.find_element_by_id("password").clear()
    driver.find_element_by_id("password").send_keys("admin")
    driver.find_element_by_id("submit").click()
    print("Login Success\n")
    driver.implicitly_wait(5)
    driver.find_element_by_id("n4").click();
    driver.implicitly_wait(5);
    driver.find_element_by_link_text(u"IP��MAC��").click()
    sleep(3);
    driver.find_element_by_name("ck").click()
    driver.find_element_by_id("btn_unbound").click()
    driver.implicitly_wait(5);
    driver.find_element_by_xpath("/html/body/div[8]/div[2]/div[4]/a[1]/span/span").click()
    sleep(3); 
    driver.find_element_by_xpath("/html/body/div[8]/div[2]/div[4]/a/span/span").click()
    
    
    driver.find_element_by_id("quit").click()
    driver.find_element_by_css_selector("div.messager-button > a.l-btn > span.l-btn-left").click()  
    print("IP_Mac Unbound Success");
    
         
    driver.quit()
    return 1
  except:
    driver.quit()
    return 0

def IP_MacBound(base_url):
  try:
    driver = webdriver.Firefox()
    driver.implicitly_wait(20)
    base_url = base_url
    driver.get(base_url)
    driver.find_element_by_id("username").clear()
    driver.find_element_by_id("username").send_keys("admin")
    driver.find_element_by_id("password").clear()
    driver.find_element_by_id("password").send_keys("admin")
    driver.find_element_by_id("submit").click()
    print("Login Success\n")
    driver.implicitly_wait(5)
    driver.find_element_by_id("n4").click();
    driver.implicitly_wait(5);
    driver.find_element_by_link_text(u"IP��MAC��").click()
    sleep(3);
    driver.find_element_by_name("ck").click()
    driver.find_element_by_id("btn_bound").click()
    driver.implicitly_wait(5);
    driver.find_element_by_xpath("/html/body/div[8]/div[2]/div[4]/a[1]/span/span").click()
    sleep(3); 
    driver.find_element_by_xpath("/html/body/div[8]/div[2]/div[4]/a/span/span").click()
    
    
    driver.find_element_by_id("quit").click()
    driver.find_element_by_css_selector("div.messager-button > a.l-btn > span.l-btn-left").click()  
    print("IP_Mac Bound Success");
    
         
    driver.quit()
    return 1
  except:
    driver.quit()
    return 0
            
def IP_MacDel(base_url):
  try:
    driver = webdriver.Firefox()
    driver.implicitly_wait(20)
    base_url = base_url
    driver.get(base_url)
    driver.find_element_by_id("username").clear()
    driver.find_element_by_id("username").send_keys("admin")
    driver.find_element_by_id("password").clear()
    driver.find_element_by_id("password").send_keys("admin")
    driver.find_element_by_id("submit").click()
    print("Login Success\n")
    driver.implicitly_wait(5)
    driver.find_element_by_id("n4").click();
    driver.implicitly_wait(5);
    driver.find_element_by_link_text(u"IP��MAC��").click()
    sleep(3);
    driver.find_element_by_name("ck").click()
    driver.find_element_by_id("btn_del").click()
    driver.implicitly_wait(5);
    driver.find_element_by_xpath("/html/body/div[11]/div[2]/div[4]/a[1]/span/span").click()
    sleep(3); 
    
    
    driver.find_element_by_id("quit").click()
    driver.find_element_by_css_selector("div.messager-button > a.l-btn > span.l-btn-left").click()  
    print("IP_Mac Del Success");
    
         
    driver.quit()
    return 1
  except:
    driver.quit()
    return 0


            