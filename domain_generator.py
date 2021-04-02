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
            f'(forall (?s - secret) (when (and (not (= ?i ag{agent})) (not (= ?j ag{agent})) (or (and (KNOWS ?i ?s) (KNOWS ag{agent} ?s) (KNOWSTHATTHEYKNOW ?i ag{agent} ?s)) (and (KNOWS ?j ?s) (KNOWS ag{agent} ?s) (KNOWSTHATTHEYKNOW ?j ag{agent} ?s)))) (and (KNOWSTHATTHEYKNOW ?i ag{agent} ?s) (KNOWSTHATTHEYKNOW ?j ag{agent} ?s))))\n'
    return start + '\t\t)\n'+'\t)\n'+')'
