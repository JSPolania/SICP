(define (reverse l)
    (define (loop original reversed)
        (if (null? original)
            reversed
            (loop (cdr original) (cons (car original) reversed))))
    (loop l '()))

(define (recur-reverse l)
   (if (null? l)
       '()
       (append (recur-reverse (cdr l)) (list (car l)))))

(define (create-list n)
    (define (loop counter items)
        (if (= counter 0)
            items
            (loop (- counter 1) (cons counter items))))
    (loop n '()))

(with-timings
           (lambda () (define x (recur-reverse (create-list 1e3))))
           (lambda (run-time gc-time real-time)
             (write (internal-time/ticks->seconds run-time))
             (write-char #\space)
             (write (internal-time/ticks->seconds gc-time))
             (write-char #\space)
             (write (internal-time/ticks->seconds real-time))
             (newline)))

