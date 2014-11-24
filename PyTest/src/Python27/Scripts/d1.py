# -*- coding:gb2312 -*-
from selenium import webdriver
from info import ip
from info import pwd
from info import base_url
from time import sleep

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
driver.find_element_by_link_text(u"IP与MAC绑定").click()
sleep(3);
driver.find_element_by_id("btn_add").click();
driver.implicitly_wait(5);
driver.find_element_by_id("ip").clear();
driver.find_element_by_id("ip").send_keys("1.1.1.1");
driver.find_element_by_id("mac").clear();
driver.find_element_by_id("mac").send_keys("aa:bb:cc:dd:ee:ff");
driver.find_element_by_id("submit").click();
driver.implicitly_wait(5);
driver.find_element_by_xpath("/html/body/div[8]/div[2]/div[4]/a/span/span").click();
    
            
driver.find_element_by_name("ck").click()
driver.find_element_by_id("btn_bound").click();
driver.implicitly_wait(5);
driver.find_element_by_xpath("/html/body/div[8]/div[2]/div[4]/a[1]/span/span").click()
driver.implicitly_wait(5); 
driver.find_element_by_xpath("/html/body/div[8]/div[2]/div[4]/a/span/span").click()
    
    
driver.find_element_by_id("quit").click()
driver.find_element_by_css_selector("div.messager-button > a.l-btn > span.l-btn-left").click()  
print("IP_Mac Add Success");