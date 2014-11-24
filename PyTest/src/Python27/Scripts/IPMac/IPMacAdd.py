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
        
ipbind = sys.argv[1]
macbind = sys.argv[2] 


a=web.IP_MacAdd(base_url,ipbind,macbind)
print a
    
          