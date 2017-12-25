(define nil ())

(define (accumulate op initial sequence)
    (if (null? sequence)
        initial
        (op (car sequence)
            (accumulate op initial (cdr sequence)))))

(define (flatmap proc seq)
    (accumulate append nil (map proc seq)))

(define (enum-interval low high)
    (if (> low high)
        nil
        (cons low (enum-interval (+ 1 low) high))))

;definition of unique-pairs using flatmap and enum-interval

(define (unique-pairs n)
    (flatmap (lambda (i)(map (lambda(j)(list i j)) (enum-interval 1 (- i 1))))
             (enum-interval 1 n)))

;definition of prime-sum-pairs using unique-pairs

(define (filter predicate sequence)
    (cond ((null? sequence) nil)
          ((predicate (car sequence))
            (cons (car sequence)
                  (filter predicate (cdr sequence))))
          (else (filter predicate (cdr sequence)))))

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

(define (make-pair-sum pair)
  (list (car pair)
        (cadr pair)
        (+ (car pair) (cadr pair))))

(define (prime? x)
   (define (test divisor)
     (cond ((> (* divisor divisor) x) true)
           ((= 0 (remainder x divisor)) false)
           (else (test (+ divisor 1))))))

(define (prime-sum-pairs n)
  (map make-pair-sum (filter prime-sum? (unique-pairs n))))


