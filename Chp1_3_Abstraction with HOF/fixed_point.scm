(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define tolerance 0.00001)

(define (sqrt x)(fixed-point (lambda (y)(/ (+ y (/ x y)) 2)) 1.0))

;(sqrt 4)
;(fixed-point (lambda (y)(/ (+ y (/ 4 y)) 2)) 1.0)
;(try 1.0)
;(try 2.5)


