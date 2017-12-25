#lang sicp  (#%require r5rs/init)

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (if (element-of-set? x set)
      set
      (cons x set)))


(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) 
         '())
        ((element-of-set? (car set1) set2)
         (cons (car set1)
               (intersection-set (cdr set1) 
                                 set2)))
        (else (intersection-set (cdr set1) 
                                set2))))

;2-59

(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((not (element-of-set? (car set1) set2))
              (union-set (cdr set1) (cons (car set1) set2)))
        (else
              (union-set (cdr set1) set2))))

(define x '(x b a r t))
(define y '(x b s o))

(element-of-set? 'x x)
(element-of-set? 'z x)

(define z (adjoin-set 'z x))

(display "intersection x y\n")

(intersection-set x y)

(display "union test\n")

(union-set x y)


