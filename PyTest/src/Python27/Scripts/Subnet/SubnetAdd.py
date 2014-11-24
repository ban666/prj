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
        
ip = sys.argv[1]
mask = sys.argv[2] 

a=web.SubnetAdd(base_url,ip,mask)
print a