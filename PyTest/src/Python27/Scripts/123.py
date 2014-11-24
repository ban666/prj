# -*- coding:gb2312 -*-
from selenium import webdriver
from info import ip
from info import pwd
from info import base_url
from time import sleep
import sys
import ssh
import web
import os
        

try:
    a=web.TimeGroupAdd(base_url)
    print a
    webdriver.quit();
except:
    print 0               
    webdriver.quit();