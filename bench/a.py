import sys

filea=open(sys.argv[1],'r')
fileb=open(sys.argv[2],'r')

load_key=set()
run_key=set()

for l in filea:
	if 'usertable' in l:
		load_key.add(l.split()[2])

for l in fileb:
	if 'usertable' in l:
		run_key.add(l.split()[2])

num_match=0
num_nomatch=0
for k in run_key:
	if k in load_key:
		num_match+=1
	else:
		num_nomatch+=1

print('num_match = %d, num_nomatch = %d' % (num_match, num_nomatch))
