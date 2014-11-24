
import sys
import ssh
        
ip = '192.168.13.13'
print sys.argv[1]
cmd = sys.argv[1]
a=ssh.SshLogin(ip,cmd)