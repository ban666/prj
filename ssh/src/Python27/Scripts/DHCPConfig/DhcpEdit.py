# -*- coding:gb2312 -*-
from selenium import webdriver
import sys
sys.path.append("../")
from info import ip
from info import pwd
from info import base_url
from time import sleep
import sys
import ssh
import web
import os

segment = sys.argv[1]
mask = sys.argv[2]
startip = sys.argv[3]
endip = sys.argv[4]

c=web.DhcpEdit(base_url,segment,mask,startip,endip)
print c