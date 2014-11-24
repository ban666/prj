#test.py
# -*- coding: utf-8 -*-   
import sys
from http import *

#处理参数
a=r'''/view/realTimeStatus/runningState/runningStateFunction.php'''
b="module:hard"
c=HttpPost(a,b)
print HttpPost(a,b)
print type(c)