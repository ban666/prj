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


a=web.IP_MacUnbound(base_url)
print a
    
          