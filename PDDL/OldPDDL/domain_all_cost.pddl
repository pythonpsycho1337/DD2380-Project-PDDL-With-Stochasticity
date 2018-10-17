(define (domain public_transport)
  (:requirements :action-costs)
  (:predicates (Person ?p) (Node ?n) (Busline ?x ?y) (Trainline ?x ?y) (Path ?x ?y) (At ?p ?n))
  
  (:functions
    (BusDist ?x ?y) (TrainDist ?x ?y) (PathDist ?x ?y)
    (total-cost)
  )

  (:action TakeBus
    :parameters( ?p ?x ?y)
    :precondition (and (Person ?p) (Node ?x) (Node ?y) (Busline ?x ?y) (At ?p ?x))
    :effect       (and (not(At ?p ?x)) (At ?p ?y)
                  (increase (total-cost) (BusDist ?x ?y)))
  )


  (:action TakeTrain
    :parameters( ?p ?x ?y)
    :precondition (and (Person ?p) (Node ?x) (Node ?y) (Trainline ?x ?y) (At ?p ?x))
    :effect       (and (not(At ?p ?x)) (At ?p ?y)
                  (increase (total-cost) (TrainDist ?x ?y)))
  )


  (:action Walk
    :parameters( ?p ?x ?y)
    :precondition (and (Person ?p) (Node ?x) (Node ?y) (Path ?x ?y) (At ?p ?x))
    :effect       (and (not(At ?p ?x)) (At ?p ?y)
                  (increase (total-cost) (PathDist ?x ?y)))
  )
)


