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
    )

    (:goal
        (and
            (KNOWS agent1 secret1) (KNOWS agent1 secret2) (KNOWS agent1 secret3) (KNOWS agent1 secret4) (not(KNOWS agent1 secret5))
            (KNOWS agent2 secret1) (KNOWS agent2 secret2) (KNOWS agent2 secret3) (KNOWS agent2 secret4) (not(KNOWS agent2 secret5))
            (KNOWS agent3 secret1) (KNOWS agent3 secret2) (KNOWS agent3 secret3) (KNOWS agent3 secret4) (not(KNOWS agent3 secret5))
            (KNOWS agent4 secret1) (KNOWS agent4 secret2) (KNOWS agent4 secret3) (KNOWS agent4 secret4) (not(KNOWS agent4 secret5))
            (not(KNOWS agent5 secret1)) (not(KNOWS agent5 secret2)) (not(KNOWS agent5 secret3)) (not(KNOWS agent5 secret4)) (KNOWS agent5 secret5)

            (KNOWS-2 agent1 agent2 secret1)      (KNOWS-2 agent1 agent2 secret2)      (KNOWS-2 agent1 agent2 secret3)      (KNOWS-2 agent1 agent2 secret4)      (not(KNOWS-2 agent1 agent2 secret5))      
            (KNOWS-2 agent1 agent3 secret1)      (KNOWS-2 agent1 agent3 secret2)      (KNOWS-2 agent1 agent3 secret3)      (KNOWS-2 agent1 agent3 secret4)      (not(KNOWS-2 agent1 agent3 secret5))     
            (KNOWS-2 agent1 agent4 secret1)      (KNOWS-2 agent1 agent4 secret2)      (KNOWS-2 agent1 agent4 secret3)      (KNOWS-2 agent1 agent4 secret4)      (not(KNOWS-2 agent1 agent4 secret5))     
            (not(KNOWS-2 agent1 agent5 secret1)) (not(KNOWS-2 agent1 agent5 secret2)) (not(KNOWS-2 agent1 agent5 secret3)) (not(KNOWS-2 agent1 agent5 secret4)) (not(KNOWS-2 agent1 agent5 secret5))

            (KNOWS-2 agent2 agent1 secret1)      (KNOWS-2 agent2 agent1 secret2)      (KNOWS-2 agent2 agent1 secret3)      (KNOWS-2 agent2 agent1 secret4)      (not(KNOWS-2 agent2 agent1 secret5))      
            (KNOWS-2 agent2 agent3 secret1)      (KNOWS-2 agent2 agent3 secret2)      (KNOWS-2 agent2 agent3 secret3)      (KNOWS-2 agent2 agent3 secret4)      (not(KNOWS-2 agent2 agent3 secret5))     
            (KNOWS-2 agent2 agent4 secret1)      (KNOWS-2 agent2 agent4 secret2)      (KNOWS-2 agent2 agent4 secret3)      (KNOWS-2 agent2 agent4 secret4)      (not(KNOWS-2 agent2 agent4 secret5))     
            (not(KNOWS-2 agent2 agent5 secret1)) (not(KNOWS-2 agent2 agent5 secret2)) (not(KNOWS-2 agent2 agent5 secret3)) (not(KNOWS-2 agent2 agent5 secret4)) (not(KNOWS-2 agent2 agent5 secret5))     

            (KNOWS-2 agent3 agent1 secret1)      (KNOWS-2 agent3 agent1 secret2)      (KNOWS-2 agent3 agent1 secret3)      (KNOWS-2 agent3 agent1 secret4)      (not(KNOWS-2 agent3 agent1 secret5))     
            (KNOWS-2 agent3 agent2 secret1)      (KNOWS-2 agent3 agent2 secret2)      (KNOWS-2 agent3 agent2 secret3)      (KNOWS-2 agent3 agent2 secret4)      (not(KNOWS-2 agent3 agent2 secret5))     
            (KNOWS-2 agent3 agent4 secret1)      (KNOWS-2 agent3 agent4 secret2)      (KNOWS-2 agent3 agent4 secret3)      (KNOWS-2 agent3 agent4 secret4)      (not(KNOWS-2 agent3 agent4 secret5))      
            (not(KNOWS-2 agent3 agent5 secret1)) (not(KNOWS-2 agent3 agent5 secret2)) (not(KNOWS-2 agent3 agent5 secret3)) (not(KNOWS-2 agent3 agent5 secret4)) (not(KNOWS-2 agent3 agent5 secret5))     

            (KNOWS-2 agent4 agent1 secret1)      (KNOWS-2 agent4 agent1 secret2)      (KNOWS-2 agent4 agent1 secret3)      (KNOWS-2 agent4 agent1 secret4)      (not(KNOWS-2 agent4 agent1 secret5))     
            (KNOWS-2 agent4 agent2 secret1)      (KNOWS-2 agent4 agent2 secret2)      (KNOWS-2 agent4 agent2 secret3)      (KNOWS-2 agent4 agent2 secret4)      (not(KNOWS-2 agent4 agent2 secret5))     
            (KNOWS-2 agent4 agent3 secret1)      (KNOWS-2 agent4 agent3 secret2)      (KNOWS-2 agent4 agent3 secret3)      (KNOWS-2 agent4 agent3 secret4)      (not(KNOWS-2 agent4 agent3 secret5))     
            (not(KNOWS-2 agent4 agent5 secret1)) (not(KNOWS-2 agent4 agent5 secret2)) (not(KNOWS-2 agent4 agent5 secret3)) (not(KNOWS-2 agent4 agent5 secret4)) (not(KNOWS-2 agent4 agent5 secret5))     

            (not(KNOWS-2 agent5 agent1 secret1)) (not(KNOWS-2 agent5 agent1 secret2)) (not(KNOWS-2 agent5 agent1 secret3)) (not(KNOWS-2 agent5 agent1 secret4)) (not(KNOWS-2 agent5 agent1 secret5))     
            (not(KNOWS-2 agent5 agent2 secret1)) (not(KNOWS-2 agent5 agent2 secret2)) (not(KNOWS-2 agent5 agent2 secret3)) (not(KNOWS-2 agent5 agent2 secret4)) (not(KNOWS-2 agent5 agent2 secret5))     
            (not(KNOWS-2 agent5 agent3 secret1)) (not(KNOWS-2 agent5 agent3 secret2)) (not(KNOWS-2 agent5 agent3 secret3)) (not(KNOWS-2 agent5 agent3 secret4)) (not(KNOWS-2 agent5 agent3 secret5))     
            (not(KNOWS-2 agent5 agent4 secret1)) (not(KNOWS-2 agent5 agent4 secret2)) (not(KNOWS-2 agent5 agent4 secret3)) (not(KNOWS-2 agent5 agent4 secret4)) (not(KNOWS-2 agent5 agent4 secret5))     
        )
    )
)
