(define (cons x y)(* (expt 2 x)(expt 3 y)))

(define (reduce n base)
  (cond ((not (= (remainder n base) 0)) 0)
        (else (+ (reduce (/ n base) base) 1))))

(define (car z)(reduce z 2))
(define (cdr z)(reduce z 3))
