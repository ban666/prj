
import sys
import ssh
from info import ip
from info import pwd
        
cmd = sys.argv[1]
print cmd
a=ssh.SshTimezone(ip,cmd)