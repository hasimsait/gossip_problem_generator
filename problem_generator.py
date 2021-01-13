import sys
import copy
from goal_generator import generateKnows

try:
    n = int(sys.argv[1])
    percentage = float(sys.argv[2])
except:
    print(
        "Couldn't read arguments.\ncall this script with \"$ python problem_generator.py n percentage\"\nn can be any integer, percentage is [0-1] float.")
    quit()

if len(sys.argv) > 3:
    # if feed is supplied
    agents = {}
    for i in range(n):
        for j in range(n):
            agents[i*n+j] = True

    feed = str(sys.argv[3]).split(' ')
    for pairIndex in range(len(feed)):
        # you could use something more useful here
        indexOfSeperator = feed[pairIndex].find('-')
        i = int(feed[pairIndex][0:indexOfSeperator])-1
        j = int(feed[pairIndex][indexOfSeperator+1:])-1
        # print(i,j)
        agents[i*n+j] = False
    feed = agents
else:
    feed = {}
    for i in range(n):
        for j in range(n):
            feed[i*n+j] = True


knows = generateKnows(n, percentage, feed)

outputStr = '(define (problem problemGossip)\n    (:domain domainGossip)\n\n    (:objects\n        '
for i in range(n):
    outputStr += 'agent'+str(i+1)+' '
outputStr += '- agent\n        '
for i in range(n):
    outputStr += 'secret'+str(i+1)+' '
outputStr += '- secret\n    )\n\n    (:init\n'

for i in range(n):
    outputStr += '        (KNOWS agent'+str(i+1)+' secret'+str(i+1)+')\n'
outputStr += '    )\n\n    (:goal\n        (and\n'
outputStr += knows
outputStr += '        )\n    )\n)'
# print(outputStr)

outputfile = 'problem_'+str(n)+'_'+str(int(percentage*100))+'.pddl'
f = open(outputfile, "w+")
f.write(outputStr)
f.close()
