(define (same-parity i . j)
    (define (loop f l)
        (cond
            ((null? l) '())
            ((f (car l)) (cons (car l)(loop f (cdr l))))
            (else (loop f (cdr l)))))
    (cons i
        (if (even? i)
            (loop (lambda (m)(even? m)) j)
            (loop (lambda (m)(odd?  m)) j))))


