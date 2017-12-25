(define (cont-frac n d k)
    (define (loop count result)
        (if (= count 0)
            result
            (loop (- count 1)
                  (/ (n 1)
                      (+ (d 1) result)))))
    (loop k 0))


