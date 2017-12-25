(define (cont-frac n d k)
    (define (loop count result)
        (if (= count 0)
            result
            (loop (- count 1)
                  (/ (n count)
                      (+ (d count) result)))))
    (loop k 0))

(define (tan-cf x k)
    (cont-frac (lambda (n)(if (= n 1) x (- (* x x))))
               (lambda (n)(- (* 2 n) 1))
                k))

