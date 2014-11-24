# -*- coding:gb2312 -*-
from selenium import webdriver
import sys
sys.path.append("../")
from info import ip
from info import pwd
from info import base_url
from time import sleep
import ssh
import web
import os
        
timename = sys.argv[1]
timedesc = sys.argv[2] 
t1 = sys.argv[3]
f1 = sys.argv[4]
t2 = sys.argv[5]
f2 = sys.argv[6]



a=web.TimeGroupAdd(base_url,timename,timedesc,t1,f1,t2,f2)
print a
    
          