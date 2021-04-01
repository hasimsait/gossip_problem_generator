;; DOMAIN FOR EPISTEMIC DEPTH 2
;; KNOWSTHATTHEYKNOW is a stupid name, feel free to suggest sth else
;; THIS ALLOWS US TO USE THE SAME DOMAIN FOR ANY N WITH DEPTH 2

(define (domain domainGossip)
	(:requirements 
		:disjunctive-preconditions 
		:equality 
		:adl
        :typing
	)

	(:predicates
		(KNOWS ?i1 ?s) (KNOWSTHATTHEYKNOW ?i1 ?i2 ?s)
	)

	(:types
		secret agent
	)

	(:action call
		:parameters (?i ?j - agent)
		:effect (and
			(forall (?s - secret) (when (or (and (KNOWS ?i ?s)) (and (KNOWS ?j ?s))) (and (KNOWS ?i ?s) (KNOWS ?j ?s) (KNOWSTHATTHEYKNOW ?i ?j ?s) (KNOWSTHATTHEYKNOW ?j ?i ?s))))
			(forall (?a - agent)
				(forall (?s - secret) 
					(when (and (not (= ?i ?a)) (not (= ?j ?a)) (or (and (KNOWS ?i ?s) (KNOWS ?a ?s) (KNOWSTHATTHEYKNOW ?i ?a ?s)) (and (KNOWS ?j ?s) (KNOWS ?a ?s) (KNOWSTHATTHEYKNOW ?j ?a ?s)))) (and (KNOWSTHATTHEYKNOW ?i ?a ?s) (KNOWSTHATTHEYKNOW ?j ?a ?s)))
				)
			)
		)
	)
)