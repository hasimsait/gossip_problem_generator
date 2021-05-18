(define (domain domainGossip)
    (:requirements
        :strips :disjunctive-preconditions :equality
    )

    (:predicates
        (KNOWS ?i1 ?s) (KNOWS-2 ?i1 ?i2 ?s)
        (CANCALL ?a1 ?a2)
    )

    (:action call
        :parameters (?i ?j)
        :precondition (CANCALL ?i ?j)
        :effect (and
            (forall (?s) (when (or (and (KNOWS ?i ?s)) (and (KNOWS ?j ?s))) (and (KNOWS ?i ?s) (KNOWS ?j ?s) (KNOWS-2 ?i ?j ?s) (KNOWS-2 ?j ?i ?s))))
            (forall (?a)
                (forall (?s) (when (and (not (= ?i ?a)) (not (= ?j ?a)) (or (and (KNOWS ?i ?s) (KNOWS ?a ?s) (KNOWS-2 ?i ?a ?s)) (and (KNOWS ?j ?s) (KNOWS ?a ?s) (KNOWS-2 ?j ?a ?s)))) (and (KNOWS-2 ?i ?a ?s) (KNOWS-2 ?j ?a ?s))))
            )
        )
    )
)