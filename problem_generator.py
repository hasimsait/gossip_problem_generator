import sys
from goal_generator import generateKnows

try:
    n=int(sys.argv[1])
    percentage=float(sys.argv[2])
except:
    print("Couldn't read arguments.\ncall this script with \"$ python problem_generator.py n percentage\"\nn can be any integer, percentage is [0-1] float.")
    quit()

if len(sys.argv)>3:
    #if an output filename is supplied
    outputfile=str(sys.argv[3])
else:
    outputfile=f'problem_{str(n)}_{str(int(percentage*100))}.pddl'

knows= generateKnows(n,percentage)

outputStr='(define (problem problemGossip)\n    (:domain domainGossip)\n\n    (:objects\n        '
for i in range(n):
    outputStr+=f'agent{str(i+1)} '
outputStr+='- agent\n        '
for i in range(n):
    outputStr+=f'secret{str(i+1)} '
outputStr+='- secret\n    )\n\n    (:init\n'

for i in range(n):
    outputStr+=f'        (KNOWS agent{str(i+1)} secret{str(i+1)})\n'
outputStr+='    )\n\n    (:goal\n        (and\n'
outputStr+=knows
outputStr+='        )\n    )\n)'
#print(outputStr)

f= open(outputfile,"w+")
f.write(outputStr)
f.close()