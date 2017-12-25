;looping throught a list

(define (elem l n)
    (if (= n 0)
        (car l)
        (elem (cdr l) (- n 1))))

;method impplemented as list-ref

;null? test if an element is empty list (nil)

;getting the lenght of a list

(define (size-recur l)
    (if (null? l)
        0
        (+ 1 (size-recur (cdr l)))))

(define (size-iter l)
    (define (size-loop l n)
        (if (null? l)
            n
            (size-loop (cdr l) (+ 1 n))))
    (size-loop l 0))

;implemented as length

;append a list to another list

(define (glue list1 list2)
    (if (null? list1)
        list2
        (cons
            (car list1)
            (glue (cdr list1) list2))))

;implemented as append

