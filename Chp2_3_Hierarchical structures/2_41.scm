(define nil ())

(define (flatmap proc seq)
    (accumulate append nil (map proc seq)))

(define (accumulate op initial sequence)
    (if (null? sequence)
        initial
        (op (car sequence)
            (accumulate op initial (cdr sequence)))))

(define (enum-interval low high)
    (if (> low high)
        nil
        (cons low (enum-interval (+ 1 low) high))))

(define (filter predicate sequence)
    (cond ((null? sequence) nil)
          ((predicate (car sequence))
            (cons (car sequence)
                  (filter predicate (cdr sequence))))
          (else (filter predicate (cdr sequence)))))

;using only flatmaps and maps (triple iteration with lambda)

(define (unique-triplets n s)
    (filter (lambda (x)(= s (accumulate + 0 x)))
        (flatmap (lambda (i)
            (flatmap (lambda(j)
                (map (lambda (k)
                    (list i j k))
                (enum-interval 1 (- j 1))))
            (enum-interval 1 (- i 1))))
        (enum-interval 1 n))))

;using un unique-pairs from 2_40

(define (unique-pairs n)
    (flatmap (lambda (i)(map (lambda(j)(list i j)) (enum-interval 1 (- i 1))))
             (enum-interval 1 n)))

(define (unique-triplets-1 n s)
    (filter (lambda (x)(= s (accumulate + 0 x)))
        (flatmap (lambda (i)
            (map (lambda (pair)
                (cons i pair))
            (unique-pairs (- i 1))))
        (enum-interval 1 n))))

;extending to the general case, l-size tuples

(define (unique-tuples l n)
    (if (= 0 l)
        (list nil)
        (flatmap (lambda (i)
            (map (lambda (tuple)
                (cons i tuple))
            (unique-tuples (- l 1) (- i 1))))
        (enum-interval 1 n))))

(define (tuples-sum-less-s s l n)
    (filter (lambda (x)(= s (accumulate + 0 x)))
        (unique-tuples l n)))

(define (unique-tuples l n)
    (if (= 0 l)
        (list nil)
        (flatmap (lambda (i) (map (lambda (tuple) (cons i tuple))(unique-tuples (- l 1) (- i 1)))) (enum-interval 1 n))))












;



