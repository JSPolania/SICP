(define (make-point x y)(cons x y))
(define (x-point p)(car p))
(define (y-point p)(cdr p))

(define (print-point p)
    (newline)
    (display "(")
    (display (x-point p))
    (display ",")
    (display (y-point p))
    (display ")"))

(define (make-segment start-p end-p)
    (cons start-p end-p))

(define (start-segment s)(car s))
(define (end-segment s)(cdr s))

(define (mid-point s)
    (let ((av (lambda (a b)(/ (+ a b) 2))))
        (make-point (av (x-point (start-segment s))
                        (x-point (end-segment s)))
                    (av (y-point (start-segment s))
                        (y-point (end-segment s))))))

