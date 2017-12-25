(define nil '())

(define (accumulate op initial sequence)
    (if (null? sequence)
        initial
        (op (car sequence)
            (accumulate op initial (cdr sequence)))))

(define (horner-eval x coefficient-sequence)
  (accumulate
   (lambda (this-coeff higher-terms)
     (+ this-coeff (* x higher-terms)))
   0
   coefficient-sequence))

(horner-eval 2 (list 1 3 0 5 0 1))

;substitution model

;(accumulate lambda 0 (list 1 3 0 5 0 1))
;(+ 1 (* 2 (accumulate lambda 0 (list 3 0 5 0 1))))
;(+ 1 (* 2 (+ 3 (* 2 (accumulate lambda 0 (list 0 5 0 1))))))
;(+ 1 (* 2 (+ 3 (* 2 (+ 0 (* 2 (accumulate lambda 0 (list 5 0 1))))))))
;(+ 1 (* 2 (+ 3 (* 2 (+ 0 (* 2 (+ 5 (* 2 (accumulate lambda 0 list(0 1))))))))))
;(+ 1 (* 2 (+ 3 (* 2 (+ 0 (* 2 (+ 5 (* 2 (+ 0 (* 2 (accumulate lambda 0 (list 1))))))))))))
;(+ 1 (* 2 (+ 3 (* 2 (+ 0 (* 2 (+ 5 (* 2 (+ 0 (* 2 (+ 1 (* 2 (accumulate lambda 0 (list ))))))))))))))
;(+ 1 (* 2 (+ 3 (* 2 (+ 0 (* 2 (+ 5 (* 2 (+ 0 (* 2 (+ 1 (* 2 0))))))))))))
;(+ 1 (* 2 (+ 3 (* 2 (+ 0 (* 2 (+ 5 (* 2 (+ 0 (* 2 (+ 1 0)))))))))))
;(+ 1 (* 2 (+ 3 (* 2 (+ 0 (* 2 (+ 5 (* 2 (+ 0 (* 2 1))))))))))
;(+ 1 (* 2 (+ 3 (* 2 (+ 0 (* 2 (+ 5 (* 2 (+ 0 2)))))))))
;(+ 1 (* 2 (+ 3 (* 2 (+ 0 (* 2 (+ 5 (* 2 2))))))))
;(+ 1 (* 2 (+ 3 (* 2 (+ 0 (* 2 (+ 5 4)))))))
;(+ 1 (* 2 (+ 3 (* 2 (+ 0 (* 2 9))))))
;(+ 1 (* 2 (+ 3 (* 2 (+ 0 18)))))
;(+ 1 (* 2 (+ 3 (* 2 18))))
;(+ 1 (* 2 (+ 3 36)))
;(+ 1 (* 2 39))
;(+ 1 78)
;79
