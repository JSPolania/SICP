;define a new binary mobile with its selectors
(define (make-mobile left right)
    (list left right))

(define (left-branch mobile)
    (car mobile))
(define (right-branch mobile)
    (car (cdr mobile)))

;define a new branch with its selectors
(define (make-branch length structure)
    (list length structure))

(define (branch-length branch)
    (car branch))
(define (branch-structure branch)
    (car (cdr branch)))

;some mobiles
(define x (make-mobile (make-branch 5 4) (make-branch 5 4)))
(define y (make-mobile (make-branch 7 9) (make-branch 10 4)))
(define z (make-mobile (make-branch 12 x) (make-branch 15 y)))
(define w (make-mobile (make-branch 4 z) (make-branch 7 8)))

;2. Total weight of a mobile
(define (total-weight mobile)
   (if (pair? mobile)
        (+ (total-weight (branch-structure (left-branch mobile)))
           (total-weight (branch-structure (right-branch mobile))))
        mobile))

;3 balanced








