(define (reverse-right sequence)
  (fold-right
   (lambda (x y) (append y (list x))) nil sequence))

(define (fold-right op initial sequence)
    (if (null? sequence)
        initial
        (op (car sequence)
            (fold-right op initial (cdr sequence)))))


;(reverse-right (list 1 2 3))
;(fold-right lambda nil (list 1 2 3))
;(append (fold-right lambda nil (list 2 3)) (list 1))
;(append (append (fold-right lambda nil (list 3)) (list 2)) (list 1))
;(append (append (append (fold-right lambda nil nil) (list 3)) (list 2)) (list 1))
;(append (append (append nil (list 3)) (list 2)) (list 1))
;(append (append (list 3) (list 2)) (list 1))
;(append (list 3 2) (list 1))
;(list 3 2 1)

(define (reverse-left sequence)
  (fold-left
   (lambda (x y) (cons y x)) nil sequence))



