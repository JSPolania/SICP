(define (smallest-divisor n)
    (find-divisor n 2))

(define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)(= (remainder b a) 0))

;(smallest-divisor 16)
;(find-divisor 16 2)
;(find-divisor 16 (+ 2 1))
;(find-divisor 16 3)
;(find-divisor 16 (+ 3 1))
;(find-divisor 16 4)
;4
