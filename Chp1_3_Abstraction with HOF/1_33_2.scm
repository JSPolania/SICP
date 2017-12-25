(define (accumulate-filter combiner null-value term a next b filter)
    (define (iter a result)
        (if (> a b) result
            (iter (next a) (combiner result
                                     (if (filter a)
                                         (term a)
                                         null-value)))))
    (iter a null-value))


 (define (gcd m n)
   (cond ((< m n) (gcd n m))
         ((= n 0) m)
         (else (gcd n (remainder m n)))))

 (define (relative-prime? m n)
 (= (gcd m n) 1))

 (define (id x) x)

(define (inc x)(+ x 1))

 (define (product-of-relative-primes n)
   (define (filter x)
     (relative-prime? x n))
 (accumulate-filter * 1 id 1 inc n filter))

