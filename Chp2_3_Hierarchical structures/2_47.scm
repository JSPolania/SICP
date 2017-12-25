#lang sicp

;constructor and selectors for vectors

(define (make-vect x y)(cons x y))
(define (xcor-vect v)(car v))
(define (ycor-vect v)(cdr v))

;list implementation for frame constructor
(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))

;selectors

(define (origin-frame frame)
  (list-ref frame 0))
(define (edge1-frame frame)
  (list-ref frame 1))
(define (edge2-frame frame)
  (list-ref frame 2))

;tests for first abstraction
(define x (make-frame (make-vect 1 1) (make-vect 0 3) (make-vect 5 5)))
(origin-frame x)
(edge2-frame x)

;frame constructor with cons implemetation

(define (make-frame1 origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

;selectors

(define (origin-frame1 frame)
  (car frame))
(define (edge1-frame1 frame)
  (car (cdr frame)))
(define (edge2-frame1 frame)
  (cdr (cdr frame)))

;tests for second abstraction
(define y (make-frame1 (make-vect 1 1) (make-vect 0 3) (make-vect 5 5)))
(origin-frame1 y)
(edge2-frame1 y)
