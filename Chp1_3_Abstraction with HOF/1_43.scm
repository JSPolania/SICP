(define (compose f g)
    (lambda (x)(f (g x))))

(define (square x)(* x x))

(define (id f n)
    (lambda(x)(if (= n 1) x (f x))))

(define (repeated f n)
    (lambda(x)(if (= n 0) x ((compose f (repeated f (- n 1))) x))))

;((repeated square 2) 5)
;((lambda(x)(if (= 2 0) x ((compose square (repeated square (- 2 1))) x))); 5)
;((lambda(x)(if (= 2 0) x ((compose square (repeated square 1)) x))) 5)
;((lambda(x)((compose square (repeated square 1)) x)) 5)
;((lambda(x)((compose square (lambda(x)(if (= 1 0) x ((compose square (;repeated square (- 1 1))) x)))) x)) 5)
;((lambda(x)((compose square (lambda(x)(if (= 1 0) x ((compose square (;repeated square 0)) x)))) x)) 5)
;((lambda(x)((compose square (lambda(x)((compose square (repeated square 0;)) x))) x)) 5)
;((lambda(x)((compose square (lambda(x)((compose square (lambda(x)(if (= 0; 0) x ((compose square (repeated square (- 0 1))) x)))) x))) x)) 5)
;((lambda(x)((compose square (lambda(x)((compose square (lambda(x)(if (= 0; 0) x ((compose square (repeated square -1)) x)))) x))) x)) 5)
;((lambda(x)((compose square (lambda(x)((compose square (lambda(x) x)) x));) x)) 5)
;((lambda(x)((compose square (lambda(x)((lambda (x)(square ((lambda(x) x) ;x))) x))) x)) 5)
;((lambda(x)((compose square (lambda(x)((lambda (x)(square x)) x))) x)) 5)
;((lambda(x)((compose square (lambda(x)(square x))) x)) 5)
;((lambda(x)((lambda (x)(square ((lambda(x)(square x)) x))) x)) 5)
;((lambda(x)((lambda (x)(square (square x))) x)) 5)
;((lambda(x)(square (square x))) 5)
;((lambda(x)(square (square x))) 5)
;(square (square 5)) => 625
