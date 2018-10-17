(define (problem find_route)

(:domain public_transport)
  (:objects person a b c d e)

  (:init (Person person)
  (Node a) (Node b) (Node c) (Node d) (Node e)

  (Busline a b) (Busline b a) (Busline b e) (Busline e b) (Busline b d) (Busline d b) (Busline d e) (Busline e d) (Busline d c) (Busline c d)

  (Trainline a d) (Trainline d a) (Trainline c d) (Trainline d c)

  (Path a b) (Path b a) (Path b e) (Path e b) (Path e d) (Path d e) (Path d c) (Path c d) (Path b d) (Path d b)

  (At person a)

  (= (total-cost)0)

  (= (BusDist a b) 3) (= (BusDist b a) 3) (= (BusDist b e) 4) (= (BusDist e b) 4) (= (BusDist e d) 3) (= (BusDist d e) 3) (= (BusDist d c) 15) (= (BusDist c d) 15)

  (= (TrainDist a d) 2) (= (TrainDist d a)2) (= (TrainDist c d)3) (= (TrainDist d c)3)

  (= (PathDist a b)12) (= (PathDist b a)12) (= (PathDist b e)16) (= (PathDist e b)16) (= (PathDist e d)12) (= (PathDist d e)12) (= (PathDist d c)12) (= (PathDist c d)12) (=(PathDist b d)20) (= (PathDist d b)20)
  )

  (:goal (At person c)
  )
  (minimize (total-cost))
)
