import random

def without_i(mylist,i):
  newlist=[]
  for element in mylist:
    if element!=i:
      newlist.append(element)
  return newlist

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

def generate_constraints(n,info,percentage):
  #basically generates a dictionary that represents what the info dict should look like in the end
  if percentage!=0:
    number_of_negative_goals_per_agent=int(n//(1/percentage))
    #rounds the number of negative goals per agent (you said uniformly distributed negative goals are prefferable)
    constraints={}
    for i in range (n):
      #for each agent
      constraints[i]=random.sample(without_i(range(n),i), number_of_negative_goals_per_agent)
      #select percentage*n agents (excluding i), for each agent i.
  table=info
  for key in table:
    table[key]=True
  if percentage==0:
    return table
  for i in range(n):
    for cons in constraints[i]:
      table[i*n+cons]=False
  #print(table)
  return table

def generateKnows(n,percentage):
  table=generate_constraints(n,generate_info(n),percentage)
  tmp=''
  for agent in range(n):
    tmp+='            '
    for secret in range(n):
      if table[agent*n+secret]==True:
        goalStr=f'(KNOWS agent{str(agent+1)} secret{str(secret+1)}) '
      else:
        goalStr=f'(not(KNOWS agent{str(agent+1)} secret{str(secret+1)})) '
      tmp += goalStr
    tmp+='\n'
  return tmp




