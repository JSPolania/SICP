(define (square-list items)
  (if (null? items)
      '()
      (cons ((lambda (x)(* x x)) (car items))
            (square-list (cdr items)))))

(define (square-list1 items)
  (map (lambda (x)(* x x)) items))
