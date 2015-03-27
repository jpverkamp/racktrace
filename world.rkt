#lang racket/base

(provide (all-defined-out))

(require racket/match
         "geometry.rkt"
         (prefix-in sphere: "objects/sphere.rkt"))

(struct world (objects))

(define (intersect ray world)
  (for/fold ([best-distance +inf.0] [best-object #f] [best-point #f])
            ([each-object (in-list (world-objects world))])
    
    (define-values (distance point)
      (match each-object
        [(? sphere:sphere?)
         (sphere:intersect ray each-object)]))
    
    (cond
      [(< distance best-distance)
       (values distance each-object point)]
      [else
       (values best-distance best-object best-point)])))