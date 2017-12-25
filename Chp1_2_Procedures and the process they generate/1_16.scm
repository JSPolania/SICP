(define (square x)(* x x))

(define (fast-expt b n)
    (define (loop b counter prod)
        (cond
            ((= counter 0) prod)
            ((even? counter)(loop (square b) (/ counter 2) prod))
            (else (loop b (- counter 1) (* b prod)))))
    (loop b n 1))

(define (even? n)(= (remainder n 2) 0))

;(fast-expt 3 4)
;(loop 3 4 1)
;(loop (square 3) 2 1)
;(loop (* 3 3) 2 1)
;(loop 9 2 1)
;(loop (square 9) 1 1)
;(loop (* 9 9) 1 1)
;(loop 81 1 1)
;(loop 81 0 1)
;243

