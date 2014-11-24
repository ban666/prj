# -*- coding:gb2312 -*-
from selenium import webdriver
import time
if __name__ == "__main__":
    driver = webdriver.Firefox()
    driver.implicitly_wait(30)
    base_url = "https://192.168.13.13:8443/"
    driver.get(base_url)
    driver.find_element_by_id("username").clear()
    driver.find_element_by_id("username").send_keys("admin")
    driver.find_element_by_id("password").clear()
    driver.find_element_by_id("password").send_keys("admin")
    driver.find_element_by_id("submit").click()
    print("Step 1:Login Success\n")
    driver.implicitly_wait(10)
             
    
    driver.find_element_by_id("n2").click()
    driver.implicitly_wait(10)

    driver.find_element_by_link_text(u"时间组").click()
    driver.implicitly_wait(10)
            
    ''''Add TimeGroup Rule''' 
    driver.find_element_by_id("btn_add").click();
    driver.implicitly_wait(10)
    s = "提交"
    driver.find_element_by_id("timename").clear();
    driver.find_element_by_id("timename").send_keys("Autotest1");
    driver.find_element_by_id("timedesc").clear();
    driver.find_element_by_id("timedesc").send_keys("Autotest1"); 
    driver.find_element_by_xpath("(//input[@name='week'])[2]").click();
    driver.find_element_by_xpath("(//input[@name='week'])[3]").click();
    driver.find_element_by_xpath("(//input[@name='week'])[4]").click();
    driver.find_element_by_xpath("(//input[@name='week'])[5]").click();
    driver.find_element_by_xpath("(//input[@name='week'])[6]").click();
    driver.find_element_by_xpath("(//input[@name='week'])[2]").click();
    driver.find_element_by_xpath("(//input[@name='week'])[3]").click();
    driver.find_element_by_xpath("(//input[@name='week'])[4]").click();
    driver.find_element_by_xpath("(//input[@name='week'])[5]").click();
    driver.find_element_by_xpath("(//input[@name='week'])[6]").click();
    driver.find_element_by_id("from1").clear();
    driver.find_element_by_id("from1").send_keys("08:59:59");
    driver.find_element_by_id("to1").clear();
    driver.find_element_by_id("to1").send_keys("11:59:59");
    driver.find_element_by_id("from2").clear();
    driver.find_element_by_id("from2").send_keys("13:59:59");
    driver.find_element_by_id("to2").clear();
    driver.find_element_by_id("to2").send_keys("17:59:59");
    driver.find_element_by_link_text(u"提交").click();
    driver.implicitly_wait(10);
            
    driver.find_element_by_id('dlg_btn_timeAdd').click();
    driver.implicitly_wait(10);
            
    print("Step 2:TimeGroup Add Success\n");
            
    ''''Edit TimGroup Rule'''
    driver.find_element_by_css_selector("#datagrid-row-r4-2-1 > td > div.datagrid-cell.datagrid-cell-c4-timename").click();
    driver.find_element_by_id("btn_edit").click();
    driver.implicitly_wait(5);
            
    ''''Edit TimGroup Rule'''
    driver.find_element_by_id("timename").clear();
    driver.find_element_by_id("timename").send_keys("Autotest2");
    driver.find_element_by_id("timedesc").clear();
    driver.find_element_by_id("timedesc").send_keys("Autotest2");
    driver.find_element_by_xpath("(//input[@name='week'])[2]").click();
    driver.find_element_by_xpath("(//input[@name='week'])[3]").click();
    driver.find_element_by_xpath("(//input[@name='week'])[4]").click();
    driver.find_element_by_xpath("(//input[@name='week'])[5]").click();
    driver.find_element_by_xpath("(//input[@name='week'])[6]").click();
    driver.find_element_by_xpath("(//input[@name='week'])[2]").click();
    driver.find_element_by_xpath("(//input[@name='week'])[3]").click();
    driver.find_element_by_xpath("(//input[@name='week'])[4]").click();
    driver.find_element_by_xpath("(//input[@name='week'])[5]").click();
    driver.find_element_by_xpath("(//input[@name='week'])[6]").click();
    driver.find_element_by_id("from1").clear();
    driver.find_element_by_id("from1").send_keys("09:00:00");
    driver.find_element_by_id("to1").clear();
    driver.find_element_by_id("to1").send_keys("12:00:00");
    driver.find_element_by_id("from2").clear();
    driver.find_element_by_id("from2").send_keys("14:00:00");
    driver.find_element_by_id("to2").clear();
    driver.find_element_by_id("to2").send_keys("18:00:00");
    driver.find_element_by_link_text(u"提交").click()
    time.sleep(5);
            
    driver.find_element_by_xpath("id('dlg_btn_timeAdd')/a[1]").click();
    time.sleep(5);
            
    print("Step 3:TimeGroup Edit Success\n");
            
    '''Del Config'''
    driver.find_element_by_css_selector("#datagrid-row-r4-2-1 > td > div.datagrid-cell.datagrid-cell-c4-timename").click();
    driver.find_element_by_id("btn_del").click();
    time.sleep(2);
            
    driver.find_element_by_className("l-btn-left").click();
    time.sleep(2);
            
    print("Step 4:TimeGroup Delete Success\n");
              
       #Log out
    driver.quit