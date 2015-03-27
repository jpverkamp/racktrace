#lang racket/base

(provide (all-defined-out))

(require racket/match
         racket/math)

(struct pt (x y z) #:prefab)
(struct ray (origin direction) #:prefab)

(define (pt+ v1 v2)
  (match-define (pt x1 y1 z1) v1)
  (match-define (pt x2 y2 z2) v2)
  (pt (+ x1 x2) (+ y1 y2) (+ z1 z2)))

(define (pt- v1 v2)
  (pt+ v1 (pt* -1 v2)))

(define (pt* s v)
  (match-define (pt x y z) v)
  (pt (* s x) (* s y) (* s z)))
  
(define (pt-dot v1 v2)
  (match-define (pt x1 y1 z1) v1)
  (match-define (pt x2 y2 z2) v2)
  (+ (* x1 x2) (* y1 y2) (* z1 z2)))

(define (pt-distance v1 v2)
  (match-define (pt x1 y1 z1) v1)
  (match-define (pt x2 y2 z2) v2)
  (sqrt (+ (sqr (- x1 x2)) (sqr (- y1 y2)) (sqr (- z1 z2)))))

(define (pt-magnitude v)
  (pt-distance (pt 0 0 0) v))

(define (pt-normalize v)
  (pt* (/ 1 (pt-magnitude v)) v))

(define (make-ray v1 v2)
  (ray v1 (pt-normalize (pt+ v2 (pt* -1 v1)))))