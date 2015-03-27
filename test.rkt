#lang racket

(require "geometry.rkt"
         "trace.rkt"
         "world.rkt"
         "objects/base.rkt")

(require (prefix-in object: "objects/sphere.rkt"))

(define w (world (list (object:sphere (color 1 0 0) (pt 0 0 0) 20)
                       (object:sphere (color 0 1 0) (pt 15 0 15) 15)
                       (object:sphere (color 0 0 1) (pt 20 15 0) 20))))

(render 200 200 w)
