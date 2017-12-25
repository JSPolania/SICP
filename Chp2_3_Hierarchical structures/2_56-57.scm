#lang sicp  (#%require r5rs/init)

;suppose you have the following procedures implemented => wishfull thinking

;(variable? e)                    Is e a variable?
;(same-variable? v1 v2)           Are v1 and v2 the same variable?
;(sum? e)                         Is e a sum?
;(addend e)                       Addend of the sum e.
;(augend e)                       Augend of the sum e.
;(make-sum a1 a2)                 Construct the sum of a1 and a2.
;(product? e)                     Is e a product?
;(multiplier e)                   Multiplier of the product e.
;(multiplicand e)                 Multiplicand of the product e.
;(make-product m1 m2)             Construct the product of m1 and m2.

;2_56
;(exponentiation? e)              Is e an exponentiation?.
;(base e)                         Base of the exponentiation e.
;(exponent e)                     Exponent of the exponentiation e.
;(make-exponentiation base exp)   Constructor of the 

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp) (if (same-variable? exp var) 1 0))
        ((sum? exp) (make-sum (deriv (addend exp) var)
                              (deriv (augend exp) var)))
        ((product? exp) (make-sum (make-product (multiplier exp)
                                                (deriv (multiplicand exp) var))
                                  (make-product (multiplicand exp)
                                                (deriv (multiplier exp) var))))
        ((exponentiation? exp) (make-product (make-product (exponent exp)
                                                           (make-exponentiation (base exp)
                                                                                (make-sum (exponent exp) -1)))
                                             (deriv (base exp) var)))
        (else (error "unknown expression type DERIV" exp))))


;representing algebraic expresions -> one abstract layer down

(define (variable? exp)(symbol? exp))

(define (same-variable? exp1 exp2)
  (and (variable? exp1)
       (variable? exp2)
       (eq? exp1 exp2)))

(define (=number? exp num)(and (number? exp)(= exp num)))

;constructor and selectors for sum

(define (sum? exp)
  (and (pair? exp)(eq? (car exp) '+)))

(define (addend sum)
  (cadr sum))

(define (augend sum)
  (if (null? (cdddr sum))
      (caddr sum)
      (append (list '+) (cddr sum))))

(define (make-sum exp1 exp2)
  (cond ((and (number? exp1)(number? exp2)) (+ exp1 exp2))
        ((=number? exp1 0) exp2)
        ((=number? exp2 0) exp1)
        (else (list '+ exp1 exp2))))

;constructor and selectors for multiplication

(define (make-product exp1 exp2)
  (cond ((=number? exp1 1) exp2)
        ((=number? exp2 1) exp1)
        ((or (=number? exp1 0)(=number? exp2 0)) 0)
        ((and (number? exp1) (number? exp2)) (* exp1 exp2))
        (else (list '* exp1 exp2))))

(define (product? exp)
  (and (pair? exp)(eq? (car exp) '*)))

(define (multiplier prod)
  (cadr prod))

(define (multiplicand prod)
  (if (null? (cdddr prod))
      (caddr prod)
      (append (list '*) (cddr prod))))

;constructor and selectors for exponentiation

(define (exponentiation? exp)
  (and (pair? exp)(eq? (car exp) '**)))

(define (base exp)
  (cadr exp))

(define (exponent exp)
  (caddr exp))

(define(make-exponentiation base exponent)
  (cond ((=number? exponent 0) 1)
        ((=number? exponent 1) base)
        ((and (number? base)(number? exponent)) (expt base exponent))
        (else (list '** base exponent))))

;tests

(deriv '(+ x 3) 'x)
;1

(deriv '(* x y) 'x)
;y

(deriv '(* (* x y) (+ x 3)) 'x)
;(+ (* x y) (* (+ x 3) y))

(deriv '(* x y (+ x 3)) 'x)

(deriv '(** x 3) 'x)
;(deriv '(* a (** x 2)) 'x)

(deriv '(+ (+ (* a (** x 2)) (* b x)) c) 'x)




