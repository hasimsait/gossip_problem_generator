(define (domain domainGossip)
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
