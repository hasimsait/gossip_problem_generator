(define (problem problemGossip)
    (:domain domainGossip)

    (:objects
        agent1 agent2 agent3 agent4 agent5 
        secret1 secret2 secret3 secret4 secret5 
    )

    (:init
        (KNOWS agent1 secret1)
        (KNOWS agent2 secret2)
        (KNOWS agent3 secret3)
        (KNOWS agent4 secret4)
        (KNOWS agent5 secret5)

        (not(CANCALL agent1 agent2)) (CANCALL agent1 agent3) (not(CANCALL agent1 agent4)) (CANCALL agent1 agent5)
        (not(CANCALL agent2 agent1)) (CANCALL agent2 agent3) (CANCALL agent2 agent4) (not(CANCALL agent2 agent5))
        (CANCALL agent3 agent1) (CANCALL agent3 agent2) (CANCALL agent3 agent4) (CANCALL agent3 agent5)
        (not(CANCALL agent4 agent1)) (CANCALL agent4 agent2) (CANCALL agent4 agent3) (CANCALL agent4 agent5)
        (CANCALL agent5 agent1) (not(CANCALL agent5 agent2)) (CANCALL agent5 agent3) (CANCALL agent5 agent4)
    )

    (:goal
        (and
            (KNOWS agent1 secret1) (KNOWS agent1 secret2) (KNOWS agent1 secret3) (KNOWS agent1 secret4) (KNOWS agent1 secret5) 
            (KNOWS agent2 secret1) (KNOWS agent2 secret2) (KNOWS agent2 secret3) (KNOWS agent2 secret4) (KNOWS agent2 secret5) 
            (KNOWS agent3 secret1) (KNOWS agent3 secret2) (KNOWS agent3 secret3) (KNOWS agent3 secret4) (KNOWS agent3 secret5) 
            (KNOWS agent4 secret1) (KNOWS agent4 secret2) (KNOWS agent4 secret3) (KNOWS agent4 secret4) (KNOWS agent4 secret5) 
            (KNOWS agent5 secret1) (KNOWS agent5 secret2) (KNOWS agent5 secret3) (KNOWS agent5 secret4) (KNOWS agent5 secret5) 
        )
    )
)
