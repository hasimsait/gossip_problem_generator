def generateDomain(d, n):

    if d == 1:
        return '''(define (domain domainGossip)
    (:requirements
        :adl
        :typing
    )
    (:predicates
        (KNOWS ?a ?s)
    )
    
    (:types
        secret agent
    )
    
    (:action call
        :parameters (?a1 ?a2 - agent)
        :effect (and (forall (?s - secret)
                        (when
                            (or
                                (KNOWS ?a1 ?s) (KNOWS ?a2 ?s)
                            )
                            (and 
                                (KNOWS ?a1 ?s) (KNOWS ?a2 ?s)
                            )
                        )
                      )
                )
           
    )
)
'''

    if d == 2:
        start = '''(define (domain domainGossip)
    (:requirements
        :strips :disjunctive-preconditions :equality
    )

    (:predicates
        (KNOWS ?i1 ?s) (KNOWS-2 ?i1 ?i2 ?s)
    )

    (:types
        secret agent
    )

    (:action call
        :parameters (?i ?j - agent)
        :effect (and
            (forall (?s - secret) (when (or (and (KNOWS ?i ?s)) (and (KNOWS ?j ?s))) (and (KNOWS ?i ?s) (KNOWS ?j ?s) (KNOWS-2 ?i ?j ?s) (KNOWS-2 ?j ?i ?s))))
'''
        padding = '            '
        for agent in range(1, n + 1):
            start += padding + \
                '(forall (?s - secret) (when (and (not (= ?i agent'+str(agent)+')) (not (= ?j agent'+str(agent)+')) (or (and (KNOWS ?i ?s) (KNOWS agent'+str(agent)+' ?s) (KNOWS-2 ?i agent'+str(agent) + \
                ' ?s)) (and (KNOWS ?j ?s) (KNOWS agent'+str(agent)+' ?s) (KNOWS-2 ?j agent'+str(agent) + \
                ' ?s)))) (and (KNOWS-2 ?i agent'+str(agent) + \
                ' ?s) (KNOWS-2 ?j agent'+str(agent)+' ?s))))\n'
        return start + '\t\t)\n' + '\t)\n' + ')'

    if d == 3:
        start = '''(define (domain domainGossip)
    (:requirements
        :strips :disjunctive-preconditions :equality
    )

    (:predicates
        (KNOWS ?i1 ?s) (KNOWS-2 ?i1 ?i2 ?s) (KNOWS-3 ?i1 ?i2 ?i3 ?s)
    )

    (:types
        secret agent
    )

    (:action call
        :parameters (?i ?j - agent)
        :effect (and
            (forall (?s - secret) (when (or (and (KNOWS ?i ?s)) (and (KNOWS ?j ?s))) (and (KNOWS ?i ?s) (KNOWS ?j ?s) (KNOWS-2 ?i ?j ?s) (KNOWS-2 ?j ?i ?s) (KNOWS-3 ?i ?j ?i ?s) (KNOWS-3 ?j ?i ?j ?s))))
'''
        padding = '\t\t\t'
        for agent in range(1, n + 1):
            start += padding + \
                '(forall (?s - secret) (when (and (not (= ?i agent'+str(agent)+')) (not (= ?j agent'+str(agent)+')) (or (and (KNOWS ?i ?s) (KNOWS-2 ?i agent'+str(agent)+' ?s) (KNOWS agent'+str(agent)+' ?s)) (and (KNOWS-2 ?j agent' + \
                str(agent)+' ?s) (KNOWS ?j ?s) (KNOWS agent'+str(agent)+' ?s)))) (and (KNOWS-2 ?i agent'+str(agent) + \
                ' ?s) (KNOWS-2 ?j agent'+str(agent)+' ?s) (KNOWS-3 ?i ?j agent' + \
                str(agent)+' ?s) (KNOWS-3 ?j ?i agent'+str(agent)+' ?s))))\n'
        for agent1 in range(1, n + 1):
            for agent2 in range(1, n + 1):
                # you could add a simple (and (not(= ?ag1 ?ag2)) to the beginning for the conditional below
                # then you can have (forall (?ag1 -agent) (forall (?ag2 -agent) (and (not(= ?ag1 ?ag2))...))
                if agent2 != agent1:
                    start += padding + \
                        '(forall (?s - secret) (when (and (not (= ?i agent'+str(agent1)+')) (not (= ?j agent'+str(agent1)+')) (or (and (KNOWS-2 ?i agent'+str(agent1)+' ?s) (KNOWS-2 ?i agent'+str(agent2)+' ?s) (KNOWS agent'+str(agent2)+' ?s) (KNOWS-3 ?i agent'+str(agent1)+' agent'+str(agent2)+' ?s) (KNOWS agent'+str(agent1)+' ?s) (KNOWS-2 agent'+str(agent1)+' agent'+str(agent2) + \
                        ' ?s) (KNOWS ?i ?s)) (and (KNOWS ?j ?s) (KNOWS-2 ?j agent'+str(agent1)+' ?s) (KNOWS-3 ?j agent'+str(agent1)+' agent'+str(agent2)+' ?s) (KNOWS agent'+str(agent2)+' ?s) (KNOWS-2 ?j agent'+str(agent2)+' ?s) (KNOWS agent'+str(
                            agent1)+' ?s) (KNOWS-2 agent'+str(agent1)+' agent'+str(agent2)+' ?s)))) (and (KNOWS-3 ?i agent'+str(agent1)+' agent'+str(agent2)+' ?s) (KNOWS-3 ?j agent'+str(agent1)+' agent'+str(agent2)+' ?s))))\n'
        return start + '\t\t)\n' + '\t)\n' + ')'
    # after this point it makes more sense to use some braincells rather than what I did above. It will always be depth-1 nested loops.
    # it takes 30 mins at depth 2 with n = 6 and n = 7 requires more than 32 gbs of ram.
