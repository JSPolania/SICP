(define (reverse l)
   (if (null? l)
       l
       (append (reverse (cdr l))
               (list (car l)))))

(define (deep-reverse l)
    (if (not (pair? l))
        l
        (append (deep-reverse (cdr  l))
            (list (deep-reverse (car l))))))

(define x
  (list (list 1 2) (list 3 4)))

;substitution model for deep-reverse on x
;(deep-reverse (list (list 1 2) (list 3 4)))
;(append (deep-reverse (cdr (list (list 1 2) (list 3 4)))) (list (deep-reverse (car (list (list 1 2) (list 3 4))))))
;(append (deep-reverse (list (list 3 4))) (list (deep-reverse (list 1 2))))
;(append (append (deep-reverse (cdr (list (list 3 4)))) (list (deep-reverse (car (list (list 3 4)))))) (list (deep-reverse (list 1 2))))
;(append (append (deep-reverse '()) (list (deep-reverse (car (list (list 3 4)))))) (list (deep-reverse (list 1 2))))
;(append (append '() (list (deep-reverse (car (list (list 3 4)))))) (list (deep-reverse (list 1 2))))
;(append (append '() (list (deep-reverse (list 3 4)))) (list (deep-reverse (list 1 2))))
;(append (append '() (list (append (deep-reverse (cdr (list 3 4))) (list (deep-reverse (car (list 3 4))))))) (list (deep-reverse (list 1 2))))
;(append (append '() (list (append (deep-reverse (list 4)) (list (deep-reverse (car (list 3 4))))))) (list (deep-reverse (list 1 2))))
;(append (append '() (list (append (append (deep-reverse (cdr (list 4))) (list (deep-reverse (car (list 4))))) (list (deep-reverse (car (list 3 4))))))) (list (deep-reverse (list 1 2))))
;(append (append '() (list (append (append (deep-reverse '()) (list (deep-reverse (car (list 4))))) (list (deep-reverse (car (list 3 4))))))) (list (deep-reverse (list 1 2))))
;(append (append '() (list (append (append '() (list (deep-reverse 4))) (list (deep-reverse (car (list 3 4))))))) (list (deep-reverse (list 1 2))))
;(append (append '() (list (append (append '() (list 4)) (list (deep-reverse (car (list 3 4))))))) (list (deep-reverse (list 1 2))))
;(append (append '() (list (append (list 4) (list (deep-reverse (car (list 3 4))))))) (list (deep-reverse (list 1 2))))
;(append (append '() (list (append (list 4) (list (deep-reverse 3))))) (list (deep-reverse (list 1 2))))
;(append (append '() (list (append (list 4) (list 3)))) (list (deep-reverse (list 1 2))))
;(append (append '() (list (list 4 3))) (list (deep-reverse (list 1 2))))
;(append (list (list 4 3)) (list (append (deep-reverse (cdr (list 1 2))) (list (deep-reverse (car (list 1 2)))))))
;(append (list (list 4 3)) (list (append (deep-reverse (list 2)) (list (deep-reverse (car (list 1 2)))))))
;(append (list (list 4 3)) (list (append (append (deep-reverse (cdr (list 2))) (list (deep-reverse (car (list 2))))) (list (deep-reverse (car (list 1 2)))))))
;(append (list (list 4 3)) (list (append (append '() (list (deep-reverse (car (list 2))))) (list (deep-reverse (car (list 1 2)))))))
;(append (list (list 4 3)) (list (append (append '() (list (deep-reverse 2))) (list (deep-reverse (car (list 1 2)))))))
;(append (list (list 4 3)) (list (append (append '() (list 2)) (list (deep-reverse (car (list 1 2)))))))
;(append (list (list 4 3)) (list (append (list 2) (list (deep-reverse (car (list 1 2)))))))
;(append (list (list 4 3)) (list (append (list 2) (list (deep-reverse 1)))))
;(append (list (list 4 3)) (list (append (list 2) (list 1))))
;(append (list (list 4 3)) (list (list 2 1)))
;(list (list 4 3)(list 2 1))







