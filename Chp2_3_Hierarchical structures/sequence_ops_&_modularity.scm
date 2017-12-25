(define nil '())

;sum of squares of the leaves of a tree

(define (sum-odd-square tree)
    (cond ((null? tree) 0)
        ((not (pair? tree))
            (if (odd? tree) (square tree) 0))
        (else (+ (sum-odd-square (car tree))
                 (sum-odd-square (cdr tree))))))

;sum of the even fib numbers less or equal to n

(define (fib n)
  (define (iter a b count)
    (if (= count n)
    b
    (iter b (+ a b) (+ count 1))))
  (iter 0 1 1))

(define (even-fibs n)
  (define (next k)
    (if (> k n)
        nil
        (let ((f (fib k)))
          (if (even? f)
              (cons f (next (+ k 1)))
              (next (+ k 1))))))
  (next 0))

;even though these procedures follow different objectives, both follow a similar signal pattern. Follow that signal flow help to to create more readingfull and modular programs.

;procedure for filtering lists according to a predicate

(define (filter predicate sequence)
    (cond ((null? sequence) nil)
          ((predicate (car sequence))
            (cons (car sequence)
                  (filter predicate (cdr sequence))))
          (else (filter predicate (cdr sequence)))))

;other version of filter using let for DRY design
(define (filter2 predicate seq)
    (let ((a (car seq))
          (b (filter predicate (cdr seq))))
        (cond ((null? seq) nil)
              ((predicate a) (cons a b))
              (else b))))

;procedure for accumulating lists according to an opeeration

(define (accumulate op initial sequence)
    (if (null? sequence)
        initial
        (op (car sequence)
            (accumulate op initial (cdr sequence)))))

;procedures for generate sequences

(define (enum-interval low high)
    (if (> low high)
        nil
        (cons low (enum-interval (+ 1 low) high))))

(define (enum-tree tree)
    (cond ((null? tree) nil)
          ((not (pair? tree)) (list tree))
          (else (append (enum-tree (car tree))
                        (enum-tree (cdr tree))))))

;with these new procedures we can formulate the sum-odd-square and even-fibs in a more modular way, abstracting each step

(define (sum-odd-square-mod tree)
    (accumulate
        +
        0
        (map square (filter odd? (enum-tree tree)))))

(define (even-fibs-mod n)
    (accumulate
        cons
        nil
        (filter even? (enum-interval 0 n))))

;these strategy allows to mix and reuse procedures

(define (list-fib-squares n)
    (accumulate
        cons
        nil
        (map square (map fib (enum-interval 0 n)))))




