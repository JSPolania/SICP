(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things))
                    answer))))
  (iter items '()))

;(square-list (list 1 2 3))
;(iter list(1 2 3) ())
;(iter (cdr (list 1 2 3)) (cons (square (car (list 1 2 3))) '()))
;(iter (list 2 3) (cons (square 1) '()))
;(iter (list 2 3) (list 1))
;(iter (cdr (list 2 3)) (cons (square (car (list 2 3))) (list 1)))
;(iter (list 3) (cons (square 2) (list 1)))
;(iter (list 3) (cons 4 (list 1)))
;(iter (list 3) (list 4 1))
;(iter (cdr (list 3)) (cons (square (car (list 3))) (list 4 1)))
;(iter (list ) (cons (square 3) (list 4 1)))
;(iter (list ) (cons 9 (list 4 1)))
;(iter (list ) (list 9 4 1))
;(list 9 4 1)
;dosent work because the second operant of the cons takes the first element of the original list and appends it to the answer list, living the original list in reverse order

(define (square-list1 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square (car things))))))
  (iter items '()))

;(square-list (list 1 2 3))
;(iter (list 1 2 3) ())
;(iter (cdr (list 1 2 3)) (cons () (square (car (list 1 2 3)))))
;(iter (list 2 3) (cons () (square 1)))
;(iter (list 2 3) (cons () 1))
;(iter (list 2 3) (list () 1))
;(iter (cdr (list 2 3)) (cons (list () 1) (square (car (list 2 3)))))
;(iter (list 3) (cons (list () 1) (square 2)))
;(iter (list 3) (cons (list () 1) 4))
;(iter (list 3) (list (list () 1) 4))
;(iter (cdr (list 3)) (cons (list (list () 1) 4) (square (car (list 3)))))
;(iter (list ) (cons (list (list () 1) 4) (square 3)))
;(iter (list ) (cons (list (list () 1) 4) 9))
;(iter (list ) (list (list (list () 1) 4) 9))
;(list (list (list () 1) 4) 9)
;
;donsent work either because changing the order ust makes the firs element of each element a list of the previos iteration, generatina list of list instead of a list with chars.






