# -*- coding: utf-8 -*-
import sys   
ofile=sys.argv[1]
file=open(ofile)
lista=""
while 1:
	line = file.readline()
	lista=lista+line
	if not line:
		break
	pass
print lista
b=lista.split('\n')
head=b[0][5:]
funcname=b[1][5:]
returntype=b[2].strip('return:')
Paramslen=len(b)-3
if Paramslen==0:
	Params=""
else:
	Params=b[3:]
	i=0
	while i < len(Params):
		Params[i]=Params[i].replace(':',',')
		Params[i]
		i+=1
print "Function:"+funcname
print "参数个数:"+str(Paramslen)


	
wfile=sys.argv[2]
file_object = open(wfile, 'w')
#head
text = "#include <stdio.h>\n"
file_object.write(text)
for i in head.split(','):
	text = "#include "+'"'+str(i)+'\"'+"\n"
	file_object.write(text)
#main
text =	"void main( int argc, char** argv )\n{\n"
file_object.write(text)
if returntype!='void':
	text =	'int res;\n'
	file_object.write(text)
#no params
if Paramslen==0:
		text =	'printf( \"Test '+funcname+'\" );\n'
		file_object.write(text)
		text =	funcname+'();\n'
		file_object.write(text)
		text =	'printf( \"End Test '+funcname+'\" );\n'
		file_object.write(text)
else:
	for arg in Params:
		Paramslist=arg.split(',',2)
		Paramstype=Paramslist[1]
		Paramsname=Paramslist[0]
		Paramsdata=Paramslist[2]
		text =	Paramstype+' '+Paramslist[0]+';\n'
		file_object.write(text)
		
	text =	'printf( \"Test '+funcname+' Begin\" );\n'
	file_object.write(text)
	flag=0
	listpname=[]
	for arg in Params:
		flag+=1
		Paramslist=arg.split(',',2)
		Paramstype=Paramslist[1]
		Paramsname=Paramslist[0]
		Paramsdata=Paramslist[2].split(',')
		Paramsmin=Paramsdata[0]
		Paramsmax=Paramsdata[1]
		listpname.append(Paramsname)
		text =	'for('+Paramslist[0] +'='+Paramsmin+'; '+Paramslist[0]+' <='+ Paramsmax+';'+ Paramslist[0]+'++ )\n{\n'
		file_object.write(text)
 	
 	text ='res ='+ funcname+'('+ str(listpname).strip('[').strip(']').replace('\'','')+' );\n'
 	file_object.write(text)
 	i=0
 	while i < flag:
 		text ='}\n'
 		file_object.write(text)
 		i+=1

text =	'printf( \"Test '+funcname+' End\" );\n}\n'
file_object.write(text) 
		
file_object.close( )