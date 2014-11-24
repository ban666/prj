# -*- coding: utf-8 -*-   
import os
import sys
import sipconfig

a=os.getcwd()
ofile="f:/5.txt"
wfile="f:/5.c"
c='python '+str(a)+'\\src\\a.py '+ofile+' '+wfile
b=os.system(c)

