(define (accumulate combiner null-value term a next b)
    (define (iter a result)
        (if (> a b) result
            (iter (next a) (combiner result (term a)))))
    (iter a null-value))

(define (sum term a next b)
    (accumulate + 0 term a next b))

(define (product term a next b)
    (accumulate * 1 term a next b))

(define (id x) x)

(define (inc x)(+ x 1))

(define (cube x)(* x x x))

(define (sum-integer a b)(sum id a inc b))

(define (sum-cube a b)(sum cube a inc b))

(define (factorial n)(product id 1 inc n))
