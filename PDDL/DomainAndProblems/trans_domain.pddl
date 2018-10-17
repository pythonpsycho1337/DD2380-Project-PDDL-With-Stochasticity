(define (domain transportation_domain)
  (:requirements :strips :typing :adl :action-costs)
  
  (:types Person Node)
  
  (:predicates
	(Metroline ?x ?y) (Busline ?x ?y) (Path ?x ?y) (At ?p ?n) (Visited ?n)
	)
			   
  (:functions (total-cost)
	(MetroDist ?x ?y) (BusDist ?x ?y) (PathDist ?x ?y)
  )
   
  (:action TakeBus
    :parameters (?p - Person ?x - Node ?y - Node)
    :precondition (and (Busline ?x ?y) (At ?p ?x))
    :effect (and (not(At ?p ?x)) (At ?p ?y) (Visited ?y) (increase (total-cost) (BusDist ?x ?y)))
   )

  (:action TakeMetro
    :parameters(?p - Person ?x - Node ?y - Node)
    :precondition (and (Metroline ?x ?y) (At ?p ?x))
    :effect       (and (not(At ?p ?x)) (At ?p ?y) (Visited ?y) (increase (total-cost) (MetroDist ?x ?y)))
  )

  (:action Walk
    :parameters(?p - Person ?x - Node ?y - Node)
    :precondition (and (Path ?x ?y) (At ?p ?x))
    :effect       (and (not(At ?p ?x)) (At ?p ?y) (Visited ?y) (increase (total-cost) (PathDist ?x ?y)))
  )

 )
