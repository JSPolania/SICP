#lang sicp
(#%require r5rs/init)

(define (equal? a b)
  (if (and (pair? a)(pair? b))
      (and (equal? (car a) (car b))
           (equal? (cdr a) (cdr b)))
      (eq? a b)))

(equal? '(a b c) '(a b c))

(equal? '(a b c) '(a (b) c))

(equal? '(a b c) '(a b))

(equal? '(a b c) 'b)

(equal? '() '())

(equal? (list 1 2 3) (list 1 2 3))