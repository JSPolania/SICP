(define (product term a next b)
    (define (iter a result)
        (if (> a b)
            result
            (iter (next a) (* result (term a)))))
    (iter a 1))

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
