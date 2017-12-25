(define nil '())

(define (fold-right op initial sequence)
    (if (null? sequence)
        initial
        (op (car sequence)
            (fold-right op initial (cdr sequence)))))

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

;(fold-right / 1 (list 1 2 3))
;(/ (car (list 1 2 3)) (fold-right / 1 (cdr (list 1 2 3))))
;(/ 1 (fold-right / 1 (cdr (list 1 2 3))))
;(/ 1 (fold-right / 1 (list 2 3)))
;(/ 1 (/ (car (list 2 3)) (fold-right / 1 (cdr (list 2 3)))))
;(/ 1 (/ 2 (fold-right / 1 (cdr (list 2 3)))))
;(/ 1 (/ 2 (fold-right / 1 (list 3))))
;(/ 1 (/ 2 (/ (car (list 3) (fold-right / 1 (cdr (list 3)))))))
;(/ 1 (/ 2 (/ 3 (fold-right / 1 (cdr (list 3))))))
;(/ 1 (/ 2 (/ 3 (fold-right / 1 nil))))
;(/ 1 (/ 2 (/ 3 1)))
;(/ 1 (/ 2 3))
;3/2

;(fold-left / 1 (list 1 2 3))
;(iter 1 (list 1 2 3))
;(iter (/ 1 (car (list 1 2 3))) (cdr (list 1 2 3)))
;(iter (/ 1 1) (cdr (list 1 2 3)))
;(iter (/ 1 1) (list 2 3))
;(iter (/ (/ 1 1) (car (list 2 3))) (cdr (list 2 3)))
;(iter (/ (/ 1 1) 2) (cdr (list 2 3)))
;(iter (/ (/ 1 1) 2) (list 3))
;(iter (/ (/ (/ 1 1) 2) (car (list 3)))  (cdr (list 3)))
;(iter (/ (/ (/ 1 1) 2) 3)  (cdr (list 3)))
;(iter (/ (/ (/ 1 1) 2) 3)  nil)
;(/ (/ (/ 1 1) 2) 3)

(fold-left list nil (list 1 2 3))
(list 1 (list 2 (list 3 nil)))

(fold-right list nil (list 1 2 3))
(list (list (list nil 1) 2) 3)

op must be associative and commutative. consider the following example








