#lang sicp

;constructor and selectors for vectors

(define (make-vect x y)(cons x y))
(define (xcor-vect v)(car v))
(define (ycor-vect v)(cdr v))

;abstraction for adding, substracting and scaling vectors

(define (add-vect v1 v2)
  (make-vect (+ (xcor-vect v1)
                (xcor-vect v2))
             (+ (ycor-vect v1)
                (ycor-vect v2))))

(define (scale-vect s v)
  (make-vect (* s (xcor-vect v))
             (* s (ycor-vect v))))

(define (sub-vect v1 v2)
  (add-vect v1 (scale-vect -1 v2)))

(define x (make-vect 1 2))
(define y (make-vect 3 4))

;tests

(scale-vect 5 y)

(add-vect x y)

(sub-vect x y)


