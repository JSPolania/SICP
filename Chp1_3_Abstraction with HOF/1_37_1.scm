(define (cont-frac n d k)
    (define (loop count)
        (if (> count k)
            0
            (/ (n count)
                (+ (d count)
                    (loop (+ count 1))))))
    (loop 1))


