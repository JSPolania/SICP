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

(define (make-rect start-p end-point)
    (cons start-p end-point))

(define (rect-start-p r)(car r))
(define (rect-end-p r)(cdr r))

(define (rect-width r)
    (abs (- (x-point (rect-start-p r))
            (x-point (rect-end-p r)))))

(define (rect-height r)
    (abs (- (y-point (rect-start-p r))
            (y-point (rect-end-p r)))))


(define (rect-perimeter r)
    (+ (* 2 (rect-height r))
       (* 2 (rect-width r))))

(define (rect-area r)
    (* (rect-height r) (rect-width r)))


