(define (domain domainGossip)
    (:requirements
        :adl
    )
    (:predicates
        (KNOWS ?a ?s)
        (CANCALL ?a1 ?a2)
    )

    (:action call
        :parameters (?a1 ?a2)
        :precondition (CANCALL ?a1 ?a2)
        :effect (and
                    (forall (?s)
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
