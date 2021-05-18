(define (domain domainGossip)
    (:requirements
        :strips :disjunctive-preconditions :equality
    )

    (:predicates
        (KNOWS ?i1 ?s) (KNOWS-2 ?i1 ?i2 ?s)
	(next ?m ?n) (at ?m)
    )

    (:action call
        :parameters (?i ?j ?m ?n)
	:precondition (and (next ?m ?n) (at ?m))
        :effect (and
            (forall (?s) (when (or (and (KNOWS ?i ?s)) (and (KNOWS ?j ?s))) (and (KNOWS ?i ?s) (KNOWS ?j ?s) (KNOWS-2 ?i ?j ?s) (KNOWS-2 ?j ?i ?s))))
            (forall (?a)
                (forall (?s) (when (and (not (= ?i ?a)) (not (= ?j ?a)) (or (and (KNOWS ?i ?s) (KNOWS ?a ?s) (KNOWS-2 ?i ?a ?s)) (and (KNOWS ?j ?s) (KNOWS ?a ?s) (KNOWS-2 ?j ?a ?s)))) (and (KNOWS-2 ?i ?a ?s) (KNOWS-2 ?j ?a ?s))))
            )
	    (not (at ?m)) (at ?n)
		)
	)
)
