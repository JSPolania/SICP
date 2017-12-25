(define (sum term a next b)
    (if (> a b)
        0
        (+ (term a)
            (sum term (next a) next b))))

; sum-integer ussing sigma abstraction

(define (identity x) x)
(define (inc x)(+ x 1))

(define (sum-integer a b)
    (sum identity a inc b))

;(sum-integer 2 5)
;(+ (identity 2)(sum identity (inc 2) inc 5))
;(+ (identity 2)(sum identity 3 inc 5))
;(+ (identity 2)(+ (identity 3)(sum identity (inc 3) inc 5)))
;(+ (identity 2)(+ (identity 3)(sum identity 4 inc 5)))
;(+ (identity 2)(+ (identity 3)(+ (identity 4)(sum identity (inc 4) inc 5))))
;(+ (identity 2)(+ (identity 3)(+ (identity 4)(sum identity 5 inc 5))))
;(+ (identity 2)(+ (identity 3)(+ (identity 4)(+ (identity 5)(sum identity (inc 5) inc 5)))))
;(+ (identity 2)(+ (identity 3)(+ (identity 4)(+ (identity 5)(sum identity 6 inc 5)))))
;(+ (identity 2)(+ (identity 3)(+ (identity 4)(+ (identity 5) 0))))
;(+ (identity 2)(+ (identity 3)(+ (identity 4)(+ 5 0))))
;(+ (identity 2)(+ (identity 3)(+ (identity 4) 5)))
;(+ (identity 2)(+ (identity 3)(+ 4 5)))
;(+ (identity 2)(+ (identity 3) 9))
;(+ (identity 2)(+ 3 9))
;(+ (identity 2) 12)
;(+ 2 12)
;12

;sum cubes implementation using sigma abstraction

(define (cube x)(* x x x))

(define (sum-cubes a b)
    (sum cube a inc b))

;(sum-cubes 2 5)
;(sum cube 2 inc 5)
;(+ (cube 2)(sum cube (inc 2) inc 5))
;(+ (cube 2)(sum cube 3 inc 5))
;(+ (cube 2)(+ (cube 3)(sum cube (inc 3) inc 5)))
;(+ (cube 2)(+ (cube 3)(sum cube 4 inc 5)))
;(+ (cube 2)(+ (cube 3)(+ (cube 4)(sum cube (next 4) next 5))))
;(+ (cube 2)(+ (cube 3)(+ (cube 4)(sum cube 5 next 5))))
;(+ (cube 2)(+ (cube 3)(+ (cube 4)(+ (cube 5)(sum cube (inc 5) inc 5)))))
;(+ (cube 2)(+ (cube 3)(+ (cube 4)(+ (cube 5)(sum cube 6 inc 5)))))
;(+ (cube 2)(+ (cube 3)(+ (cube 4)(+ (cube 5) 0))))
;(+ (cube 2)(+ (cube 3)(+ (cube 4)(+ 25 0))))
;(+ (cube 2)(+ (cube 3)(+ (cube 4) 25)))
;(+ (cube 2)(+ (cube 3)(+ 16 25)))
;(+ (cube 2)(+ (cube 3) 41))
;(+ (cube 2)(+ 9 41))
;(+ (cube 2) 50)
;(+ 4 50)
;(+ 4 50)
;54
