(define (for-each f items)
    (f (car items))
    (if (null? (cdr items))
        true
        (for-each f (cdr items))))

; be aware that this dosent work with an empty list
