(define (double x)(+ x x))
(define (halve x)(/ x 2))
(define (even? n)(= (remainder n 2) 0))

(define (* a b)
    (define (loop a b acc)
        (cond ((= b 0) acc)
              ((even? b)(loop (double a) (halve b) acc))
              (else (loop a (- b 1) (+ acc a)))))
    (loop a b 0))




