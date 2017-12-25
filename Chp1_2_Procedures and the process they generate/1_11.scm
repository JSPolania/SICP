(define (f_rec n)
    (if (< n 3)
        n
        (+ (f_rec (- n 1))
           (* 2 (f_rec (- n 2)))
           (* 3 (f_rec (- n 3))))))

(define (f_iter n)
    (define (iter a b c counter)
        (if (= counter (+ n 1))
            c
            (iter b c (+ (* 3 a)(* 2 b) c)(+ counter 1))))
    (cond ((< n 0) 0)
          ((< n 3) n)
          (else (iter 0 1 2 3))))

;(f_iter 4)
;(iter 0 1 2 3)
;(iter 1 2 4 4)
;(iter 2 4 11 5)
;11




