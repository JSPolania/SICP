;general procedures

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
            (cons (car sequence) (filter predicate (cdr sequence))))
          (else (filter predicate (cdr sequence)))))

;constructor + accesors

(define (make-position row column) (list row column))
(define (position-row position) (car position))
(define (position-column position) (cadr position))
(define empty-board nil)

;-----------------------------------------------------------------

(define (adjoin-position row column rest-of-queens)
    (append rest-of-queens (list (make-position row column))))

(define (attack? q1 q2)
    (or (= (position-row q1) (position-row q2))
        (= (position-column q1) (position-column q2))
        (= (abs (- (position-row q1) (position-row q2)))
           (abs (- (position-column q1) (position-column q2))))))

;-----------------------------------------------------------------
(define (safe? column positions)
  (let ((kth-queen (list-ref positions (- column 1)))
        (attackers (filter (lambda (x)(not (= (position-column x) column))) positions)))
  (accumulate (lambda (x y)(and x y))
              true
              (map (lambda (x)(not (attack? kth-queen x))) attackers))))

;-----------------------------------------------------------------

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions)
           (safe? k positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position new-row k rest-of-queens))
                 (enum-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))
