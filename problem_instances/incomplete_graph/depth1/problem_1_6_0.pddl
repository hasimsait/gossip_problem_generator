(define (problem problemGossip)
    (:domain domainGossip)

    (:objects
        agent1 agent2 agent3 agent4 agent5 agent6 
        secret1 secret2 secret3 secret4 secret5 secret6 
    )

    (:init
        (KNOWS agent1 secret1)
        (KNOWS agent2 secret2)
        (KNOWS agent3 secret3)
        (KNOWS agent4 secret4)
        (KNOWS agent5 secret5)
        (KNOWS agent6 secret6)

        (CANCALL agent1 agent2) (CANCALL agent1 agent3) (CANCALL agent1 agent4) (CANCALL agent1 agent5) (CANCALL agent1 agent6)
        (CANCALL agent2 agent1) (CANCALL agent2 agent3) (CANCALL agent2 agent4) (CANCALL agent2 agent5) (CANCALL agent2 agent6)
        (CANCALL agent3 agent1) (CANCALL agent3 agent2) (CANCALL agent3 agent4) (CANCALL agent3 agent5) (CANCALL agent3 agent6)
        (CANCALL agent4 agent1) (CANCALL agent4 agent2) (CANCALL agent4 agent3) (CANCALL agent4 agent5) (CANCALL agent4 agent6)
        (CANCALL agent5 agent1) (CANCALL agent5 agent2) (CANCALL agent5 agent3) (CANCALL agent5 agent4) (CANCALL agent5 agent6)
        (CANCALL agent6 agent1) (CANCALL agent6 agent2) (CANCALL agent6 agent3) (CANCALL agent6 agent4) (CANCALL agent6 agent5)
    )

    (:goal
        (and
            (KNOWS agent1 secret1) (KNOWS agent1 secret2) (KNOWS agent1 secret3) (KNOWS agent1 secret4) (KNOWS agent1 secret5) (KNOWS agent1 secret6) 
            (KNOWS agent2 secret1) (KNOWS agent2 secret2) (KNOWS agent2 secret3) (KNOWS agent2 secret4) (KNOWS agent2 secret5) (KNOWS agent2 secret6) 
            (KNOWS agent3 secret1) (KNOWS agent3 secret2) (KNOWS agent3 secret3) (KNOWS agent3 secret4) (KNOWS agent3 secret5) (KNOWS agent3 secret6) 
            (KNOWS agent4 secret1) (KNOWS agent4 secret2) (KNOWS agent4 secret3) (KNOWS agent4 secret4) (KNOWS agent4 secret5) (KNOWS agent4 secret6) 
            (KNOWS agent5 secret1) (KNOWS agent5 secret2) (KNOWS agent5 secret3) (KNOWS agent5 secret4) (KNOWS agent5 secret5) (KNOWS agent5 secret6) 
            (KNOWS agent6 secret1) (KNOWS agent6 secret2) (KNOWS agent6 secret3) (KNOWS agent6 secret4) (KNOWS agent6 secret5) (KNOWS agent6 secret6) 
        )
    )
)