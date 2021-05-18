(define (problem problemGossip)
    (:domain domainGossip)

    (:objects
        agent1 agent2 agent3 
        secret1 secret2 secret3 
    )

    (:init
        (KNOWS agent1 secret1)
        (KNOWS agent2 secret2)
        (KNOWS agent3 secret3)

        (CANCALL agent1 agent2) (CANCALL agent1 agent3)
        (CANCALL agent2 agent1) (CANCALL agent2 agent3)
        (CANCALL agent3 agent1) (CANCALL agent3 agent2)
    )

    (:goal
        (and
            (KNOWS agent1 secret1) (KNOWS agent1 secret2) (KNOWS agent1 secret3) 
            (KNOWS agent2 secret1) (KNOWS agent2 secret2) (KNOWS agent2 secret3) 
            (KNOWS agent3 secret1) (KNOWS agent3 secret2) (KNOWS agent3 secret3) 
            (KNOWS-2 agent1 agent2 secret1) (KNOWS-2 agent1 agent2 secret2) (KNOWS-2 agent1 agent2 secret3) 
            (KNOWS-2 agent1 agent3 secret1) (KNOWS-2 agent1 agent3 secret2) (KNOWS-2 agent1 agent3 secret3) 
            (KNOWS-2 agent2 agent1 secret1) (KNOWS-2 agent2 agent1 secret2) (KNOWS-2 agent2 agent1 secret3) 
            (KNOWS-2 agent2 agent3 secret1) (KNOWS-2 agent2 agent3 secret2) (KNOWS-2 agent2 agent3 secret3) 
            (KNOWS-2 agent3 agent1 secret1) (KNOWS-2 agent3 agent1 secret2) (KNOWS-2 agent3 agent1 secret3) 
            (KNOWS-2 agent3 agent2 secret1) (KNOWS-2 agent3 agent2 secret2) (KNOWS-2 agent3 agent2 secret3) 
        )
    )
)