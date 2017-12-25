(define (compose f g)
    (lambda (x)(f (g x))))

(define (square x)(* x x))

(define (inc x)(+ x 1))

;((compose square inc) 6)
;((lambda (x)(square (inc x))) 6)
;(square (inc 6))
;(square (+ 6 1))
;(square 7)
;(* 7 7)
;49
