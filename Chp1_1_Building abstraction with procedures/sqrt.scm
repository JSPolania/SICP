(define (abs x)
  (if (< x 0) (- x) x))

(define (square x)(* x x))

(define (cube x)(* x x x))

(define (root-iter guess x root improve)
  (if (good-enough? guess x root)
      guess
      (root-iter (improve guess x) x root improve)))

(define (sqrt-improve guess x)
  (/ (+ guess (/ x guess )) 2))

(define (good-enough? guess x root)
  (< (abs (- (root guess) x)) 0.001))

; procedure to calculate square roots

(define (sqrt x)
  (root-iter 1.0 x square sqrt-improve))

; procedure to calculate cube roots

(define (cube-root-improve guess x)
  (/ (+ (/ x (square guess)) 
	(* 2 guess)) 
     3))

(define (cube-root x)
  (root-iter 1.0 x cube cube-root-improve))










