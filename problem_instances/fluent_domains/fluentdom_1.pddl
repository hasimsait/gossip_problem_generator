(define (domain domainGossip)
    (:requirements
        :adl
    )
    (:predicates
        (KNOWS ?a ?s)
	(next ?m ?n)
	(at ?m)
    )

    (:action call
        :parameters (?a1 ?a2 ?m ?n)
	:precondition (and (next ?m ?n) (at ?m))
        :effect (and (forall (?s)
                       (when
                            (or
                                (KNOWS ?a1 ?s) (KNOWS ?a2 ?s)
                            )
                            (and
                                (KNOWS ?a1 ?s) (KNOWS ?a2 ?s)
                            )
                        )
        	)
		;;increase total cost
		(not (at ?m)) (at ?n) 
	)

    )
)
