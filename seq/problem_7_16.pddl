(define (problem problemGossip)
    (:domain domainGossip)

    (:objects
        agent1 agent2 agent3 agent4 agent5 agent6 agent7 - agent
        secret1 secret2 secret3 secret4 secret5 secret6 secret7 - secret
    )

    (:init
        (KNOWS agent1 secret1)
        (KNOWS agent2 secret2)
        (KNOWS agent3 secret3)
        (KNOWS agent4 secret4)
        (KNOWS agent5 secret5)
        (KNOWS agent6 secret6)
        (KNOWS agent7 secret7)
    )

    (:goal
        (and
            (KNOWS agent1 secret1) (KNOWS agent1 secret2) (KNOWS agent1 secret3) (KNOWS agent1 secret4) (KNOWS agent1 secret5) (not(KNOWS agent1 secret6)) (KNOWS agent1 secret7) 
            (KNOWS agent2 secret1) (KNOWS agent2 secret2) (KNOWS agent2 secret3) (KNOWS agent2 secret4) (KNOWS agent2 secret5) (not(KNOWS agent2 secret6)) (KNOWS agent2 secret7) 
            (not(KNOWS agent3 secret1)) (KNOWS agent3 secret2) (KNOWS agent3 secret3) (KNOWS agent3 secret4) (KNOWS agent3 secret5) (KNOWS agent3 secret6) (KNOWS agent3 secret7) 
            (not(KNOWS agent4 secret1)) (KNOWS agent4 secret2) (KNOWS agent4 secret3) (KNOWS agent4 secret4) (KNOWS agent4 secret5) (KNOWS agent4 secret6) (KNOWS agent4 secret7) 
            (not(KNOWS agent5 secret1)) (KNOWS agent5 secret2) (KNOWS agent5 secret3) (KNOWS agent5 secret4) (KNOWS agent5 secret5) (KNOWS agent5 secret6) (KNOWS agent5 secret7) 
            (not(KNOWS agent6 secret1)) (KNOWS agent6 secret2) (KNOWS agent6 secret3) (KNOWS agent6 secret4) (KNOWS agent6 secret5) (KNOWS agent6 secret6) (KNOWS agent6 secret7) 
            (KNOWS agent7 secret1) (KNOWS agent7 secret2) (KNOWS agent7 secret3) (KNOWS agent7 secret4) (KNOWS agent7 secret5) (not(KNOWS agent7 secret6)) (KNOWS agent7 secret7) 
        )
    )
)