(define x (1 3 (5 7) 9))
;equivalent to
(list 1 3 (list 5 7) 9)
;answer (car (cdr (car (cdr (cdr x)))))

(define y ())
;equivalent to
(cons (cons 7 ()) ())
(list (list 7))
;answer  (car (car y))

(define z (1 (2 (3 (4 (5 (6 7)))))))
;equivalent to
(list 1 (list 2 (list 3 (list 4 (list 6 (list 6 7))))))
;(car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr z))))))))))))



