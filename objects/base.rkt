#lang racket/base

(provide (all-defined-out))

(struct color (r g b) #:prefab)
(struct object (color) #:prefab)
