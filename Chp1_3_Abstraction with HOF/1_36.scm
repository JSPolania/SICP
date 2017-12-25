(define (fixed-point f first-guess)
  (define (print-line value)
    (display value)
    (newline))
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (print-line guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define tolerance 0.00001)

(fixed-point (lambda (y)(/ (log 1000)(log y))) 2.0)

(fixed-point (lambda (y)(/ (+ y (/ (log 1000)(log y))) 2) 2.0))




