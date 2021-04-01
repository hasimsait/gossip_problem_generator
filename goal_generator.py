import random


def without_i(mylist, i):
    newlist = []
    for element in mylist:
        if element not in i:
            newlist.append(element)
    return newlist


def generate_constraints(n, percentage, seed):
    # generates a dictionary that represents what the info dict should look like in the end
    if percentage != 0:
        number_of_negative_goals_per_agent = int(n // (1 / percentage))
        # round the number of negative goals per agent
        # (uniformly distributed negative goals are prefferable)
        constraints = {}
        for i in range(n):
            doNotInclude = []
            for j in range(n):
                if seed[i * n + j] is False:
                    doNotInclude.append(j)
            doNotInclude.append(i)
            # print(number_of_negative_goals_per_agent-len(doNotInclude))
            constraints[i] = random.sample(
                without_i(range(n), doNotInclude),
                number_of_negative_goals_per_agent - len(doNotInclude) + 1)
            # select percentage*n agents (excluding i), for each agent i.
    table = seed
    if percentage == 0:
        return table
    for i in range(n):
        for cons in constraints[i]:
            table[i * n + cons] = False
    # print(table)
    return table


def generateKnows(depth, n, percentage, seed):
    table = generate_constraints(n, percentage, seed)
    tmp = ''
    printForSeed = '"'
    for agent in range(n):
        tmp += '            '
        for secret in range(n):
            if table[agent * n + secret] is True:
                goalStr = '(KNOWS agent'+str(agent+1) + \
                    ' secret'+str(secret+1)+') '
            else:
                goalStr = '(not(KNOWS agent'+str(agent+1) + \
                    ' secret'+str(secret+1)+')) '
                printForSeed += str(agent + 1) + '-' + str(secret + 1) + ' '
            tmp += goalStr
        tmp += '\n'
    if depth == 2:
        for agent1 in range(1, n + 1):
            for agent2 in range(1, n + 1):
                if agent1 != agent2:
                    tmp += '            '
                    for secret in range(1, n + 1):
                        # TODO the not part.
                        # If I add it the same way we will have many infeasible instances
                        goalStr = '(KNOWSTHATTHEYKNOW agent'+str(agent1) +\
                            ' agent'+str(agent2) + ' secret'+str(secret)+') '
                        tmp += goalStr
                    tmp += '\n'

    if printForSeed != '"':
        # don't print seed when there is no seed to print ie. percentage = 0
        print(printForSeed[:-1] + '"')
    return tmp
