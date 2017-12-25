(define (sum term a next b)
    (if (> a b)
        0
        (+ (term a)
            (sum term (next a) next b))))

(define (integral f a b dx)
    (define (add-dx x)(+ x dx))
    (* (sum f (+ a (/ dx 2.0)) add-dx b)
        dx))

(define (cube x)(* x x x))

(define (id x) x)

;(integral id 0 1 0.2)
;(* (sum id (+ 0 (/ 0.2 2.0)) add-dx 1) 0.2)
;(* (sum id 0.1 add-dx 1) 0.2)
;(* (+ (id 0.1)(sum id (add-dx 0.1) add-dx 1)) 0.2)
;(* (+ (id 0.1)(sum id (+ 0.1 0.2) add-dx 1)) 0.2)
;(* (+ (id 0.1)(sum id 0.3 add-dx 1)) 0.2)
;(* (+ (id 0.1)(+ (id 0.3)(sum id (add-dx 0.3) add-dx 1))) 0.2)
;(* (+ (id 0.1)(+ (id 0.3)(sum id (+ 0.3 0.2) add-dx 1))) 0.2)
;(* (+ (id 0.1)(+ (id 0.3)(sum id 0.5 add-dx 1))) 0.2)
;(* (+ (id 0.1)(+ (id 0.3)(+ (id 0.5)(sum id (add-dx 0.5) add-dx 1)))) 0.2)
;(* (+ (id 0.1)(+ (id 0.3)(+ (id 0.5)(sum id (+ 0.5 0.2) add-dx 1)))) 0.2)
;(* (+ (id 0.1)(+ (id 0.3)(+ (id 0.5)(sum id 0.7 add-dx 1)))) 0.2)
;(* (+ (id 0.1)(+ (id 0.3)(+ (id 0.5)(+ (id 0.7)(sum id (add-dx 0.7) add-dx 1))))) 0.2)
;(* (+ (id 0.1)(+ (id 0.3)(+ (id 0.5)(+ (id 0.7)(sum id (+ 0.7 0.2) add-dx 1))))) 0.2)
;(* (+ (id 0.1)(+ (id 0.3)(+ (id 0.5)(+ (id 0.7)(sum id 0.9 add-dx 1))))) 0.2)
;(* (+ (id 0.1)(+ (id 0.3)(+ (id 0.5)(+ (id 0.7)(+ (id 0.9)(sum id (add-dx 0.9) add-dx 1)))))) 0.2)
;(* (+ (id 0.1)(+ (id 0.3)(+ (id 0.5)(+ (id 0.7)(+ (id 0.9)(sum id (+ 0.9 0.2) add-dx 1)))))) 0.2)
;(* (+ (id 0.1)(+ (id 0.3)(+ (id 0.5)(+ (id 0.7)(+ (id 0.9)(sum id 1.1 add-dx 1)))))) 0.2)
;(* (+ (id 0.1)(+ (id 0.3)(+ (id 0.5)(+ (id 0.7)(+ (id 0.9) 0))))) 0.2)
;(* (+ (id 0.1)(+ (id 0.3)(+ (id 0.5)(+ (id 0.7)(+ 0.9 0))))) 0.2)
;(* (+ (id 0.1)(+ (id 0.3)(+ (id 0.5)(+ (id 0.7) 0.9)))) 0.2)
;(* (+ (id 0.1)(+ (id 0.3)(+ (id 0.5)(+ 0.7 0.9)))) 0.2)
;(* (+ (id 0.1)(+ (id 0.3)(+ (id 0.5) 1.6))) 0.2)
;(* (+ (id 0.1)(+ (id 0.3)(+ 0.5 1.6))) 0.2)
;(* (+ (id 0.1)(+ (id 0.3) 2.1)) 0.2)
;(* (+ (id 0.1)(+ 0.3 2.1)) 0.2)
;(* (+ (id 0.1) 2.4) 0.2)
;(* (+ 0.1 2.4) 0.2)
;(* 2.5 0.2)






