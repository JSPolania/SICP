(define (inc x)(+ x 1))

(define (dec x)(- x 1))

(define (sum1 a b)
  (if (= a 0)
      b
      (inc (sum1 (dec a) b))))

;(sum1 4 5)
;(inc (sum1 (dec 4) 5))
;(inc (sum1 3 5))
;(inc (inc (sum1 (dec 3) 5)))
;(inc (inc (sum1 2 5)))
;(inc (inc (inc (sum1 (dec 2) 5))))
;(inc (inc (inc (sum1 1 5))))
;(inc (inc (inc (inc (sum1 (dec 1) 5)))))
;(inc (inc (inc (inc (sum1 0 5)))))
;(inc (inc (inc (inc 5))))
;(inc (inc (inc 6)))
;(inc (inc 7))
;(inc 8)
;9


(define (sum2 a b)
  (if (= a 0)
      b
      (sum2 (dec a)(inc b))))

;(sum2 4 5)
;(sum2 (dec 4)(inc 5))
;(sum2 3 6)
;(sum2 (dec 3)(inc 6))
;(sum3 2 7)
;(sum2 (dec 2)(inc 7))
;(sum2 1 8)
;(sum2 (dec 1)(inc 8))
;(sum2 0 9)
;9





