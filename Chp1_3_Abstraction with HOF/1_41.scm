(define (double f)
    (lambda (x)(f (f x))))

(define (inc x)(+ x 1))

(((double double) inc) 5)
(((lambda (x)(double (double x))) inc) 5)
;be aware the form ((lambda (p1 p2...) body) v1 v2...)
; inc is applied to the big lambda function
((double (double inc)) 5)
((double (lambda (x)(inc (inc x)))) 5)
((lambda(x)(inc (inc (inc (inc x))))) 5)
;be aware of that applyng the lamda is an operation. delete the outer parentesis
(inc (inc (inc (inc 5)))) ; => 9 OK!!!


(((double (double double)) inc) 5)
(((double (lambda (x)(double (double x)))) inc) 5)
(((lambda (x)(double (double (double (double x))))) inc) 5)
((double (double (double (double inc)))) 5)
((double (double (double (lambda (x)(inc (inc x)))))) 5)
((double (double (lambda (x)(inc (inc (inc (inc x))))))) 5)
((double (lambda (x)(inc (inc (inc (inc (inc (inc (inc (inc x)))))))))) 5)
((lambda (x)(inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc x))))))))))))))))) 5)
(inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc 5)))))))))))))))); => 21
