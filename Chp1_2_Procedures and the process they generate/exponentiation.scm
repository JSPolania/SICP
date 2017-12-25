(define (square x)(* x x))

(define (fast-expt b n)
    (cond ((= n 0) 1)
          ((even? n)(square (fast-expt b (/ n 2))))
          (else (* b (fast-expt b (- n 1))))))

(define (even? n)(= (remainder n 2) 0))

;(fast-expt 3 5)
;(* 3 (fast-expt 3 4))
;(* 3 (square (fast-expt 3 2)))
;(* 3 (square (square (fast-expt 3 1))))
;(* 3 (square (square (* 3 (fast-expt 3 0)))))
;(* 3 (square (square (* 3 1))))
;(* 3 (square (square 3)))
;(* 3 (square (* 3 3)))
;(* 3 (square 9))
;(* 3 (* 9 9))
;(* 3 81)
;(243)



