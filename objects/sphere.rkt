#lang racket/base

(provide (all-defined-out))

(require racket/match
         racket/math
         "../geometry.rkt"
         "base.rkt")

(struct sphere object (center radius) #:prefab)

(define (intersect r o)
  (match-define (ray origin direction) r)
  (match-define (sphere color center radius) o)

  (define l○o-c (pt-dot direction (pt- origin center)))
  (define discriminant (+ (sqr l○o-c) (- (sqr (pt-magnitude (pt- origin center)))) (sqr radius)))
  (cond 
    [(< discriminant 0) 
     (values +inf.0 #f)]
    [else
     (define distance 
       (min (+ (- l○o-c) (sqrt discriminant))
            (+ (- l○o-c) (- (sqrt discriminant)))))
     (values distance (pt* distance direction))]))