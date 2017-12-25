(define (cont-frac n d k)
    (define (loop count result)
        (if (= count 0)
            result
            (loop (- count 1)
                  (/ (n 1)
                      (+ (d 1) result)))))
    (loop k 0))


    (define (euler-e)
        (+ 2 (cont-frac
                        (lambda (i) 1.0)
                        (lambda (i) (if (= (remainder i 3) 2)
                                        (* (quotient (+ i 1) 3) 2)
                                        1))
                        100)))


