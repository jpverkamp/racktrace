#lang racket/base

(provide (all-defined-out))

(require images/flomap
         racket/match
         "geometry.rkt"
         "world.rkt"
         "objects/base.rkt")

; TODO: reflection
; TODO: refraction
; TODO: walls  

(define (trace ray world)
  (define-values (d obj p) (intersect ray world))
  (cond 
    [obj => object-color]
    [else #f]))

(define (render width height scene)
  (flomap->bitmap 
   (build-flomap* 
    3 width height
    (λ (x y)
      (match (trace (make-ray (pt 0 0 -100) 
                              (pt (- x (/ width 2)) 
                                  (- y (/ height 2)) 
                                  0))
                    scene)
        [(color r g b)
         (vector r g b)]
        [_
         (vector 1 1 1)])))))
