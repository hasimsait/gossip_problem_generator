def generateDomain(d, n):
    if d is not 2:
        return ''
    start = '''(define (domain domainGossip)
	(:requirements
		:strips :disjunctive-preconditions :equality
	)

	(:predicates
		(KNOWS ?i1 ?s) (KNOWSTHATTHEYKNOW ?i1 ?i2 ?s)
	)

	(:types
        secret agent
    )

	(:action call
		:parameters (?i ?j - agent)
		:effect (and
			(forall (?s - secret) (when (or (and (KNOWS ?i ?s)) (and (KNOWS ?j ?s))) (and (KNOWS ?i ?s) (KNOWS ?j ?s) (KNOWSTHATTHEYKNOW ?i ?j ?s) (KNOWSTHATTHEYKNOW ?j ?i ?s))))
'''
    padding = '			'
    for agent in range(1, n+1):
        start += padding + \
            '(forall (?s - secret) (when (and (not (= ?i ag'+str(agent)+')) (not (= ?j ag'+str(agent)+')) (or (and (KNOWS ?i ?s) (KNOWS ag'+str(agent)+' ?s) (KNOWSTHATTHEYKNOW ?i ag'+str(agent) + \
            ' ?s)) (and (KNOWS ?j ?s) (KNOWS ag'+str(agent)+' ?s) (KNOWSTHATTHEYKNOW ?j ag'+str(agent) + \
            ' ?s)))) (and (KNOWSTHATTHEYKNOW ?i ag'+str(agent) + \
            ' ?s) (KNOWSTHATTHEYKNOW ?j ag'+str(agent)+' ?s))))\n'
    return start + '\t\t)\n'+'\t)\n'+')'
