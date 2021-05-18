(define (domain domainGossip)
    (:requirements
        :strips :disjunctive-preconditions :equality
    )

    (:predicates
        (KNOWS ?i1 ?s) (KNOWS-2 ?i1 ?i2 ?s) (KNOWS-3 ?i1 ?i2 ?i3 ?s)
        (CANCALL ?a1 ?a2)
    )

    (:action call
        :parameters (?i ?j)
        :precondition (CANCALL ?i ?j)
        :effect (and
            (forall (?s) (when (or (and (KNOWS ?i ?s)) (and (KNOWS ?j ?s))) (and (KNOWS ?i ?s) (KNOWS ?j ?s) (KNOWS-2 ?i ?j ?s) (KNOWS-2 ?j ?i ?s) (KNOWS-3 ?i ?j ?i ?s) (KNOWS-3 ?j ?i ?j ?s))))
            (forall (?a)
                (forall (?s) (when (and (not (= ?i ?a)) (not (= ?j ?a)) (or (and (KNOWS ?a ?s) (KNOWS-2 ?i ?a ?s) (KNOWS ?i ?s)) (and (KNOWS ?a ?s) (KNOWS ?j ?s) (KNOWS-2 ?j ?a ?s)))) (and (KNOWS-2 ?i ?a ?s) (KNOWS-2 ?j ?a ?s) (KNOWS-3 ?i ?j ?a ?s) (KNOWS-3 ?j ?i ?a ?s))))
            )
            (forall (?ag1) (forall (?ag2) (and (not (= ?ag1 ?ag2))
                (forall (?s) (when (and (not (= ?i ?ag1)) (not (= ?j ?ag1)) (or (and (KNOWS ?ag2 ?s) (KNOWS ?ag1 ?s) (KNOWS-2 ?i ?ag1 ?s) (KNOWS-3 ?i ?ag1 ?ag2 ?s) (KNOWS-2 ?ag1 ?ag2 ?s) (KNOWS ?i ?s) (KNOWS-2 ?i ?ag2 ?s)) (and (KNOWS ?ag2 ?s) (KNOWS ?j ?s) (KNOWS-2 ?j ?ag1 ?s) (KNOWS ?ag1 ?s) (KNOWS-3 ?j ?ag1 ?ag2 ?s) (KNOWS-2 ?ag1 ?ag2 ?s) (KNOWS-2 ?j ?ag2 ?s)))) (and (KNOWS-3 ?i ?ag1 ?ag2 ?s) (KNOWS-3 ?j ?ag1 ?ag2 ?s))))
            )))
        )
    )
)