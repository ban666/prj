import paramiko
from info import username
from info import pwd
import time 
def SshLogin (ip,cmd,username=username,password=pwd,port='22'):
   ssh = paramiko.SSHClient()
   ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
   ssh.connect(ip,22,username,password)
   stdin,stdout,stderr = ssh.exec_command(cmd)
   a = stdout.readlines()  
   print a
   return a


def SshCmd (ip,cmd,username=username,password=pwd,port='22'):
   ssh = paramiko.SSHClient()      
   ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
   ssh.connect(ip,22,username,password)
   wwww = 'cd wwww;' 
   stdin,stdout,stderr = ssh.exec_command(wwww+cmd)
   a = stdout.readlines()  
   print a
   return a


def SshChannel (ip,cmd,username=username,password=pwd,port='22'):
   ssh = paramiko.SSHClient()
   ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
   ssh.connect(ip,22,username,password)
   dir = 'cd /root/bm/sec_bm;'
   stdin,stdout,stderr = ssh.exec_command(dir+cmd)
   a = stdout.readlines()  
   print a
   return a

def SshTimezone (ip,cmd,username=username,password=pwd,port='22'):
   ssh = paramiko.SSHClient()      
   ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
   ssh.connect(ip,22,username,password)
   wwww = 'cd /usr/share/zoneinfo;' 
   stdin,stdout,stderr = ssh.exec_command(wwww+cmd)
   a = stdout.readlines()  
   print a
   return a