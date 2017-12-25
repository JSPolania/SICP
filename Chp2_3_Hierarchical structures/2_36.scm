(define nil '())

(define (accumulate op initial sequence)
    (if (null? sequence)
        initial
        (op (car sequence)
            (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))

;(accumulate-n + 0 (list (list 1 2) (list 3 4)))
;(cons (accumulate + 0 (map car (list (list 1 2) (list 3 4)))) (accumulate-n + 0 (map cdr (map cdr seqs))))
;(cons (accumulate + 0 (list 1 3)) (accumulate-n + 0 (map cdr (list (list 1 2) (list 3 4)))))
;(cons 4 (accumulate-n + 0 (map cdr (list (list 1 2) (list 3 4)))))
;(cons 4 (accumulate-n + 0 (list (list 2) (list 4))))
;(cons 4 (cons (accumulate + 0 (map car (list (list 2) (list 4)))) (accumulate-n + 0 (map cdr (list (list 2) (list 4))))))
;(cons 4 (cons (accumulate + 0 (list 2 4)) (accumulate-n + 0 (map cdr (list (list 2) (list 4))))))
;(cons 4 (cons 6 (accumulate-n + 0 (map cdr (list (list 2) (list 4))))))
;(cons 4 (cons 6 (accumulate-n + 0 (list nil nil))))
;(cons 4 (cons 6 nil))
;(list 4 6)






