(define (product term a next b)
    (if (> a b)
        1
        (* (term a)
            (product term (next a) next b))))

(define (pi-aprox x)
    (define (y k)
        (if (= (remainder k 2) 0)
        (/ (+ k 2)(+ k 1))
        (/ (+ k 1)(+ k 2))))
    (* 4.0 (product y 1.0 inc x)))

(define (id x) x)

(define (inc x)(+ x 1))

(define (cube x)(* x x x))

(define (factorial n)
    (product id 1 inc n))



