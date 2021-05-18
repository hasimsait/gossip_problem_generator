(define (problem problemGossip)
    (:domain domainGossip)

    (:objects
        agent1 agent2 agent3 agent4 agent5 agent6 agent7 agent8 
        secret1 secret2 secret3 secret4 secret5 secret6 secret7 secret8 
    )

    (:init
        (KNOWS agent1 secret1)
        (KNOWS agent2 secret2)
        (KNOWS agent3 secret3)
        (KNOWS agent4 secret4)
        (KNOWS agent5 secret5)
        (KNOWS agent6 secret6)
        (KNOWS agent7 secret7)
        (KNOWS agent8 secret8)

        (not(CANCALL agent1 agent2)) (not(CANCALL agent1 agent3)) (not(CANCALL agent1 agent4)) (not(CANCALL agent1 agent5)) (not(CANCALL agent1 agent6)) (not(CANCALL agent1 agent7)) (CANCALL agent1 agent8)
        (not(CANCALL agent2 agent1)) (CANCALL agent2 agent3) (not(CANCALL agent2 agent4)) (not(CANCALL agent2 agent5)) (not(CANCALL agent2 agent6)) (not(CANCALL agent2 agent7)) (not(CANCALL agent2 agent8))
        (not(CANCALL agent3 agent1)) (CANCALL agent3 agent2) (CANCALL agent3 agent4) (not(CANCALL agent3 agent5)) (not(CANCALL agent3 agent6)) (not(CANCALL agent3 agent7)) (CANCALL agent3 agent8)
        (not(CANCALL agent4 agent1)) (not(CANCALL agent4 agent2)) (CANCALL agent4 agent3) (CANCALL agent4 agent5) (CANCALL agent4 agent6) (CANCALL agent4 agent7) (CANCALL agent4 agent8)
        (not(CANCALL agent5 agent1)) (not(CANCALL agent5 agent2)) (not(CANCALL agent5 agent3)) (CANCALL agent5 agent4) (CANCALL agent5 agent6) (CANCALL agent5 agent7) (CANCALL agent5 agent8)
        (not(CANCALL agent6 agent1)) (not(CANCALL agent6 agent2)) (not(CANCALL agent6 agent3)) (CANCALL agent6 agent4) (CANCALL agent6 agent5) (CANCALL agent6 agent7) (CANCALL agent6 agent8)
        (not(CANCALL agent7 agent1)) (not(CANCALL agent7 agent2)) (not(CANCALL agent7 agent3)) (CANCALL agent7 agent4) (CANCALL agent7 agent5) (CANCALL agent7 agent6) (CANCALL agent7 agent8)
        (CANCALL agent8 agent1) (not(CANCALL agent8 agent2)) (CANCALL agent8 agent3) (CANCALL agent8 agent4) (CANCALL agent8 agent5) (CANCALL agent8 agent6) (CANCALL agent8 agent7)
    )

    (:goal
        (and
            (KNOWS agent1 secret1) (KNOWS agent1 secret2) (KNOWS agent1 secret3) (KNOWS agent1 secret4) (KNOWS agent1 secret5) (KNOWS agent1 secret6) (KNOWS agent1 secret7) (KNOWS agent1 secret8) 
            (KNOWS agent2 secret1) (KNOWS agent2 secret2) (KNOWS agent2 secret3) (KNOWS agent2 secret4) (KNOWS agent2 secret5) (KNOWS agent2 secret6) (KNOWS agent2 secret7) (KNOWS agent2 secret8) 
            (KNOWS agent3 secret1) (KNOWS agent3 secret2) (KNOWS agent3 secret3) (KNOWS agent3 secret4) (KNOWS agent3 secret5) (KNOWS agent3 secret6) (KNOWS agent3 secret7) (KNOWS agent3 secret8) 
            (KNOWS agent4 secret1) (KNOWS agent4 secret2) (KNOWS agent4 secret3) (KNOWS agent4 secret4) (KNOWS agent4 secret5) (KNOWS agent4 secret6) (KNOWS agent4 secret7) (KNOWS agent4 secret8) 
            (KNOWS agent5 secret1) (KNOWS agent5 secret2) (KNOWS agent5 secret3) (KNOWS agent5 secret4) (KNOWS agent5 secret5) (KNOWS agent5 secret6) (KNOWS agent5 secret7) (KNOWS agent5 secret8) 
            (KNOWS agent6 secret1) (KNOWS agent6 secret2) (KNOWS agent6 secret3) (KNOWS agent6 secret4) (KNOWS agent6 secret5) (KNOWS agent6 secret6) (KNOWS agent6 secret7) (KNOWS agent6 secret8) 
            (KNOWS agent7 secret1) (KNOWS agent7 secret2) (KNOWS agent7 secret3) (KNOWS agent7 secret4) (KNOWS agent7 secret5) (KNOWS agent7 secret6) (KNOWS agent7 secret7) (KNOWS agent7 secret8) 
            (KNOWS agent8 secret1) (KNOWS agent8 secret2) (KNOWS agent8 secret3) (KNOWS agent8 secret4) (KNOWS agent8 secret5) (KNOWS agent8 secret6) (KNOWS agent8 secret7) (KNOWS agent8 secret8) 
        )
    )
)
