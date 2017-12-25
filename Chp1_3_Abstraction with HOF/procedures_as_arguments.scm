;procedure to sum all the integers between a and b
(define (sum-integers a b)
    if (> a b)
        0
        (+ a (sum-integers (+ a 1) b)))

;(sum-integers 2 5)
;(+ 2 (sum-integers 3 5))
;(+ 2 (+ 3 (sum-integers 4 5)))
;(+ 2 (+ 3 (+ 4 (sum-integers 5 5))))
;(+ 2 (+ 3 (+ 4 (+ 5 (sum-integers 6 5)))))
;(+ 2 (+ 3 (+ 4 (+ 5 0))))
;(+ 2 (+ 3 (+ 4 5)))
;(+ 2 (+ 3 9))
;(+ 2 12)
;12


;procedure to sum al the cubes between a and b
(define (cube x)(* x x x))

(define (sum-cubes a b)
    if (a > b)
        0
        (+ cube(a) (sum-cubes (+ a 1) b)))

;(sum-cubes 2 5)
;(+ 4 (sum-cubes 3 5))
;(+ 4 (+ 9 (sum-cubes 4 5)))
;(+ 4 (+ 9 (+ 16 (sum-cubes 5 5))))
;(+ 4 (+ 9 (+ 16 (+ 25 (sum-cubes 6 5)))))
;(+ 4 (+ 9 (+ 16 (+ 25 0))))
;(+ 4 (+ 9 (+ 16 25)))
;(+ 4 (+ 9 41))
;(+ 4 50)
;54

; sum of a series to converge to pi / 8

(define (pi-sum a b)
    if (a > b)
        0
        (+ (/ 1 (* a (+ a 2))
            (pi-sum (+ a 4) b))))

