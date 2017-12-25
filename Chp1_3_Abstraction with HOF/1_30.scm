(define (sum term a next b)
    (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))))
    (iter a 0))

(define (simpson-sum f a b n)
    (define h (/ (- b a) n))
    (define (inc n)(+ n 1))
    (define (y k)
        (define (trans k)
            (cond ((or (= k 0)(= k n)) 1)
                  ((= (remainder k 2) 0) 2)
                  (else 4)))
        (* (trans k)(f (+ a (* k h)))))
        (define (trans k)(f (+ a (* k h))))
    (* (sum y 0 inc n)(/ h 3)))

(define (id x) x)

(define (inc x)(+ x 1))

(define (cube x)(* x x x))

(define (sum-integer a b)
    (sum id a inc b))

(define (sum-cube a b)
    (sum cube a inc b))



