(define (fib n)
  (cond ((= n 0) 0)
	((= n 1) 1)
	(else (+ (fib (- n 1))
		 (fib (- n 2))))))

(define (fib_iter n)
  (define (iter a b count)
    (if (= count n)
	b
	(iter b (+ a b) (+ count 1))))
  (iter 0 1 1))

;(fib_iter 6)
;(iter 0 1 1)
;(iter 1 1 2)
;(iter 1 2 3)
;(iter 2 3 4)
;(iter 3 5 5)
;(iter 5 8 6)
;8


