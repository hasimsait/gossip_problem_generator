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


def generate_constraints_d2(depth, n, percentage):
    if depth < 2:
        return
    constraints = {}
    if percentage != 0:
        number_of_negative_goals_per_agent = int(n//(1 / percentage))
        for i in range(n):
            for j in range(n):
                if i != j:
                    constraints[i*n+j] = random.sample(
                        range(n), number_of_negative_goals_per_agent)
                    # select percentage*n agents (excluding i), for each agent i. for each second agent j
                    # 1 knows 1 knows 1 is invalid but 1 knows 2 knows 1 and 1 knows 2 knows 2 is valid
    return constraints


def generate_constraints_d3(depth, n, percentage):
    if depth < 3:
        return
    constraints = {}
    if percentage != 0:
        number_of_negative_goals_per_agent = int(n//(1 / percentage))
        for i in range(n):
            for j in range(n):
                if i != j:
                    for k in range(n):
                        if k != j:
                            constraints[i*n*n+j*n+k] = random.sample(
                                range(n), number_of_negative_goals_per_agent)
                            # select percentage*n agents (excluding i), for each agent i. for each second agent j
                            # 1 knows 1 knows 1 is invalid but 1 knows 2 knows 1 and 1 knows 2 knows 2 is valid
    return constraints


def generateKnows(depth, n, percentage, seed):
    table = generate_constraints(n, percentage, seed)
    d2_constraint_dict = generate_constraints_d2(depth, n, percentage)
    d3_constraint_dict = generate_constraints_d3(depth, n, percentage)
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
    if depth >= 2:
        for agent1 in range(1, n + 1):
            for agent2 in range(1, n + 1):
                if agent1 != agent2:
                    tmp += '            '
                    for secret in range(1, n + 1):
                        # gen constraints' loop is [0,n)
                        if secret-1 not in d2_constraint_dict[(agent1-1)*n+agent2-1]:
                            goalStr = '(KNOWS-2 agent'+str(agent1) +\
                                ' agent'+str(agent2) + ' secret' + \
                                str(secret)+')      '
                        else:
                            goalStr = '(not(KNOWS-2 agent'+str(agent1) +\
                                ' agent'+str(agent2) + ' secret' + \
                                str(secret)+')) '
                        tmp += goalStr
                    tmp += '\n'
    if depth >= 3:
        for agent1 in range(1, n + 1):
            for agent2 in range(1, n + 1):
                if agent1 != agent2:
                    for agent3 in range(1, n + 1):
                        if agent2 != agent3:
                            tmp += '            '
                            for secret in range(1, n + 1):
                                if secret-1 not in d3_constraint_dict[(agent1-1)*n*n+(agent2-1)*n+agent3-1]:
                                    goalStr = '(KNOWS-3 agent' + str(
                                        agent1
                                    ) + ' agent' + str(agent2) + ' agent' + str(
                                        agent3) + ' secret' + str(secret) + ')      '
                                else:
                                    goalStr = '(not(KNOWS-3 agent' + str(
                                        agent1
                                    ) + ' agent' + str(agent2) + ' agent' + str(
                                        agent3) + ' secret' + str(secret) + ')) '
                                tmp += goalStr
                            tmp += '\n'
    # same applies here, you could improve this easily but you won't be able to use those
    # depth =5 n =100 instances anyways
    if printForSeed != '"':
        # don't print seed when there is no seed to print ie. percentage = 0
        print(printForSeed[:-1] + '"')
    return tmp
