# -*- coding: utf-8 -*-   
# -*- encoding=utf-8 -*-
a= '\xb2\xe2\xca\xd4'
print type(a)
b = a.decode('utf-8').encode('gb2312')
print b