(define dx 0.0001)

(define (smooth-f f)
    (lambda(x)(/ (+ (f (- x dx))
                    (f x)
                    (f (+ x dx)))
                  3)))

(define (compose f g)
    (lambda (x)(f (g x))))

(define (repeated f n)
    (lambda(x)(if (= n 0) x ((compose f (repeated f (- n 1))) x))))

(define (n-fold-smooth f n)
    (repeated smooth-f n) f)

