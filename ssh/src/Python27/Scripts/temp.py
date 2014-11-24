
import sys
import ssh
        
ip = '192.168.11.221'
print sys.argv[1]
cmd = sys.argv[1]
a=ssh.SshChannel(ip,cmd,'root','netrule123')