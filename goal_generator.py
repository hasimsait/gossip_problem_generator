import random


def without_i(mylist, i):
    newlist = []
    for element in mylist:
        if element not in i:
            newlist.append(element)
    return newlist


'''
def generate_info(n):
  agents={}
  for i in range(n):
    for j in range(n):
      if i==j:
        agents[i*n+i]=True
      else:
        agents[i*n+j]=False
  #print(agents)
  return agents
'''


def generate_constraints(n, percentage, feed):
    # basically generates a dictionary that represents what the info dict should look like in the end
    if percentage != 0:
        number_of_negative_goals_per_agent = int(n//(1/percentage))
        # rounds the number of negative goals per agent (you said uniformly distributed negative goals are prefferable)
        constraints = {}
        for i in range(n):
            doNotInclude = []
            for j in range(n):
                if feed[i*n+j] == False:
                    doNotInclude.append(j)
            doNotInclude.append(i)
            #print(number_of_negative_goals_per_agent-len(doNotInclude))
            constraints[i] = random.sample(without_i(
                range(n), doNotInclude), number_of_negative_goals_per_agent-len(doNotInclude)+1)
            # select percentage*n agents (excluding i), for each agent i.
    table = feed
    if percentage == 0:
        return table
    for i in range(n):
        for cons in constraints[i]:
            table[i*n+cons] = False
    #print(table)
    return table


def generateKnows(n, percentage, feed):
    table = generate_constraints(n, percentage, feed)
    tmp = ''
    printForSeed='"'
    for agent in range(n):
        tmp += '            '
        for secret in range(n):
            if table[agent*n+secret] == True:
                goalStr = '(KNOWS agent'+str(agent+1) + \
                    ' secret'+str(secret+1)+') '
            else:
                goalStr = '(not(KNOWS agent'+str(agent+1) + \
                    ' secret'+str(secret+1)+')) '
                printForSeed+=str(agent+1)+'-'+str(secret+1)+' '
            tmp += goalStr
        tmp += '\n'
    print(printForSeed[:-1]+'"')
    return tmp
