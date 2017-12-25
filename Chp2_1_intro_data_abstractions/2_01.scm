(define (gcd a b)
    (if (= b 0) a (gcd b (remainder a b))))

(define (make-rat n d)
    (let ((g (gcd (abs n) (abs d))))
        (let ((make (lambda (a b)(cons (/ a g)(/ b g)))))
            (if (< (* n d) 0) (make (* -1 (abs n)) (abs d))
                              (make (abs n) (abs d))))))

(define (num x)(car x))
(define (den x)(cdr x))

(define (print-rat x)
    (newline)
    (display (num x))
    (display "/")
    (display (den x)))

(define (add-rat x y)
    (make-rat (+ (* (num x)(den y))(* (num y)(den x)))
              (* (den x)(den y))))

(define (sub-rat x y)
    (make-rat (- (* (num x)(den y))(* (num y)(den x)))
              (* (den x)(den y))))

(define (mul-rat x y)
    (make-rat (* (num x)(num y))
              (* (den x)(den y))))

(define (div-rat x y)
    (make-rat (* (num x)(den y))
              (* (den x)(num y))))

(define (equal-rat? x y)
    (= (* (num x)(den y))
       (* (num y)(den x))))

(define x (list 1 2 3 4))

(display x)


