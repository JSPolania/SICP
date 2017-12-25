(define (derive g)
    (lambda (x)(/ (- (g (+ x dx))(g x)) dx)))

(define dx 0.00001)

(define (newton-transform f)
    (lambda (x) (- x (/ (f x)
                     ((derive f) x)))))

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       0.00001))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

