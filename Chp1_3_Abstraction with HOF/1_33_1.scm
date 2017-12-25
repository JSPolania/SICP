(define (accumulate-filter combiner null-value term a next b filter)
    (if (> a b)
        null-value
        (combiner (if (filter a)
                       (term a)
                       null-value)
                  (accumulate-filter combiner
                                     null-value
                                     term
                                     (next a)
                                     next
                                     b
                                     filter))))


(define (smallest-div n)
    (define (divides? a b)
      (= 0 (remainder b a)))
    (define (find-div n test)
       (cond ((> (inc test) n) n) ((divides? test n) test)
             (else (find-div n (+ test 1)))))
    (find-div n 2))

(define (prime? n)
   (if (= n 1) false (= n (smallest-div n))))

(define (id x) x)

(define (inc x)(+ x 1))

(define (square x)(* x x))

(define (sum-primes a b)
    (accumulate-filter + 0 id a inc b prime?))

(define (sum-cube-primes a b)
    (accumulate-filter + 0 square a inc b prime?))

