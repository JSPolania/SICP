#lang sicp  (#%require r5rs/init)

;selectors and constructor for binary tree

(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right)
  (list entry left right))

;element of set?

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((= x (entry set)) true)
        ((< x (entry set))
         (element-of-set? 
          x 
          (left-branch set)))
        ((> x (entry set))
         (element-of-set? 
          x 
          (right-branch set)))))

;adjoin-set

(define (adjoin-set x set)
  (cond ((null? set) (make-tree x '() '()))
        ((= x (entry set)) set)
        ((< x (entry set))
         (make-tree 
          (entry set)
          (adjoin-set x (left-branch set))
          (right-branch set)))
        ((> x (entry set))
         (make-tree
          (entry set)
          (left-branch set)
          (adjoin-set x (right-branch set)))))) 

;list to tree

(define (fold-right op initial sequence)
    (if (null? sequence)
        initial
        (op (car sequence)
            (fold-right op initial (cdr sequence)))))

(define (list->tree l)
  (fold-right adjoin-set '() (reverse l)))

(list->tree '(1 3 5 7 9 11))
(define x '(7 (3 (1 () ()) (5 () ())) (9 () (11 () ()))))
(define y '(3 (1 () ()) (7 (5 () ()) (9 () (11 () ())))))
(define z '(5 (3 (1 () ()) ()) (9 (7 () ()) (11 () ()))))

; 2_63

(define (tree->list-1 tree)
  (if (null? tree)
      '()
      (append 
       (tree->list-1 
        (left-branch tree))
       (cons (entry tree)
             (tree->list-1 
              (right-branch tree))))))

(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
        result-list
        (copy-to-list 
         (left-branch tree)
         (cons (entry tree)
               (copy-to-list 
                (right-branch tree)
                result-list)))))
  (copy-to-list tree '()))

(display "proc 1 test\n")
(tree->list-1 x)
(tree->list-1 y)
(tree->list-1 z)

(display "proc 2 test\n")
(tree->list-2 x)
(tree->list-2 y)
(tree->list-2 z)

;Q1: both procedures do the same operation and return the same lists

;Q2 the second procedure grows slower than the first. second O(n), first grows O(n log n)


