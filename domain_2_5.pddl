(define (domain domainGossip)
	(:requirements
		:strips :disjunctive-preconditions :equality
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
			(forall (?s - secret) (when (and (not (= ?i ag1)) (not (= ?j ag1)) (or (and (KNOWS ?i ?s) (KNOWS ag1 ?s) (KNOWSTHATTHEYKNOW ?i ag1 ?s)) (and (KNOWS ?j ?s) (KNOWS ag1 ?s) (KNOWSTHATTHEYKNOW ?j ag1 ?s)))) (and (KNOWSTHATTHEYKNOW ?i ag1 ?s) (KNOWSTHATTHEYKNOW ?j ag1 ?s))))

			(forall (?s - secret) (when (and (not (= ?i ag2)) (not (= ?j ag2)) (or (and (KNOWS ?i ?s) (KNOWSTHATTHEYKNOW ?i ag2 ?s) (KNOWS ag2 ?s)) (and (KNOWS ?j ?s) (KNOWS ag2 ?s) (KNOWSTHATTHEYKNOW ?j ag2 ?s)))) (and (KNOWSTHATTHEYKNOW ?i ag2 ?s) (KNOWSTHATTHEYKNOW ?j ag2 ?s))))

			(forall (?s - secret) (when (and (not (= ?i ag3)) (not (= ?j ag3)) (or (and (KNOWS ?i ?s) (KNOWSTHATTHEYKNOW ?i ag3 ?s) (KNOWS ag3 ?s)) (and (KNOWSTHATTHEYKNOW ?j ag3 ?s) (KNOWS ?j ?s) (KNOWS ag3 ?s)))) (and (KNOWSTHATTHEYKNOW ?i ag3 ?s) (KNOWSTHATTHEYKNOW ?j ag3 ?s))))

			(forall (?s - secret) (when (and (not (= ?i ag4)) (not (= ?j ag4)) (or (and (KNOWS ?i ?s) (KNOWSTHATTHEYKNOW ?i ag4 ?s) (KNOWS ag4 ?s)) (and (KNOWSTHATTHEYKNOW ?j ag4 ?s) (KNOWS ag4 ?s) (KNOWS ?j ?s)))) (and (KNOWSTHATTHEYKNOW ?i ag4 ?s) (KNOWSTHATTHEYKNOW ?j ag4 ?s))))

			(forall (?s - secret) (when (and (not (= ?i ag5)) (not (= ?j ag5)) (or (and (KNOWS ?i ?s) (KNOWSTHATTHEYKNOW ?i ag5 ?s) (KNOWS ag5 ?s)) (and (KNOWSTHATTHEYKNOW ?j ag5 ?s) (KNOWS ag5 ?s) (KNOWS ?j ?s)))) (and (KNOWSTHATTHEYKNOW ?i ag5 ?s) (KNOWSTHATTHEYKNOW ?j ag5 ?s))))
		)
	)
)