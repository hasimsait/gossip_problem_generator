#! /usr/bin/env python3

import sys
import copy
from goal_generator import generateKnows
from domain_generator import generateDomain

cancall = True
# TODO this is horrible but I don't want to have another argument in this script.
# We could parse with something else and get better support.
# This looks like my CS201 homeworks, I hate it.

try:
    d = int(sys.argv[1])
    n = int(sys.argv[2])
    percentage = float(sys.argv[3])
except:
    print(
        "Couldn't read arguments.\ncall this script with \"$ problem_generator.py d n percentage\"\nd is 1 or 2, n can be any integer, percentage is [0-1] float."
    )
    quit()

if len(sys.argv) > 4:
    # if seed is supplied
    agents = {}
    for i in range(n):
        for j in range(n):
            agents[i * n + j] = True

    seed = str(sys.argv[4]).split(' ')
    for pairIndex, value in enumerate(seed):
        # you could use something more useful here
        indexOfSeperator = seed[pairIndex].find('-')
        i = int(value[0:indexOfSeperator]) - 1
        j = int(value[indexOfSeperator + 1:]) - 1
        # print(i,j)
        agents[i * n + j] = False
    seed = agents
else:
    seed = {}
    for i in range(n):
        for j in range(n):
            seed[i * n + j] = True

knows = generateKnows(d, n, percentage, seed)

outputStr = '(define (problem problemGossip)\n    (:domain domainGossip)\n\n    (:objects\n        '
for i in range(n):
    outputStr += 'agent' + str(i + 1) + ' '
outputStr += '\n        '
for i in range(n):
    outputStr += 'secret' + str(i + 1) + ' '
outputStr += '\n    )\n\n    (:init\n'

for i in range(n):
    outputStr += '        (KNOWS agent' + str(i + 1) + \
        ' secret' + str(i + 1) + ')\n'
if cancall:
    for i in range(1, n + 1):
        outputStr += '\n        '
        for j in range(1, n + 1):
            if i != j:
                outputStr += '(CANCALL agent' + str(i) + ' agent' + str(
                    j) + ') '
        outputStr = outputStr[:-1]
    outputStr += '\n'
outputStr += '    )\n\n    (:goal\n        (and\n'
outputStr += knows
outputStr += '        )\n    )\n)'
outputfile = 'problem_' + str(d) + '_' + str(n) + '_' + str(
    int(percentage * 100)) + '.pddl'

domain = generateDomain(d, n)
f = open("domain_" + str(d) + '.pddl', "w+")
f.write(domain)
f.close()

f = open(outputfile, "w+")
f.write(outputStr)
f.close()
