#lang sicp  (#%require r5rs/init)

;selectors and constructor for binary tree

(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right)
  (list entry left right))

(define (tree->list tree)
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

(define (list->tree elements)
  (define (partial-tree elts n)
  (if (= n 0)
      (cons '() elts)
      (let ((left-size (quotient (- n 1) 2)))
        (let ((left-result (partial-tree elts left-size)))
          (let ((left-tree (car left-result))
                (non-left-elts (cdr left-result))
                (right-size (- n (+ left-size 1))))
            (let ((this-entry (car non-left-elts))
                  (right-result (partial-tree (cdr non-left-elts) right-size)))
              (let ((right-tree (car right-result))
                    (remaining-elts (cdr right-result)))
                (cons (make-tree this-entry 
                                 left-tree 
                                 right-tree)
                      remaining-elts))))))))
  (car (partial-tree 
        elements (length elements))))

;union-set

(define (union-set tree1 tree2)
  (define (union-lists list1 list2)
  (cond ((null? list1) list2)
        ((null? list2) list1)
        (else (let ((x1 (car list1))(x2 (car list2)))
                (cond ((= x1 x2) (cons x1 (union-lists (cdr list1) (cdr list2))))
                      ((< x1 x2) (cons x1 (union-lists (cdr list1) list2)))
                      ((> x1 x2) (cons x2 (union-lists list1 (cdr list2)))))))))
  (list->tree (union-lists (tree->list tree1) (tree->list tree2))))

(define x (list->tree '(1 3 5 7 9)))
(define y (list->tree '(2 4 6 8 10)))

(display "union test\n")

(define z (union-set x y))
z

;intersection-set

(define (intersection-sets tree1 tree2)
  (define (intersection-lists set1 set2)
    (if (or (null? set1) (null? set2))
      '()
      (let ((x1 (car set1)) (x2 (car set2)))
        (cond ((= x1 x2)
               (cons x1 (intersection-lists 
                         (cdr set1)
                         (cdr set2))))
              ((< x1 x2) (intersection-lists 
                          (cdr set1) 
                          set2))
              ((< x2 x1) (intersection-lists
                          set1 
                          (cdr set2)))))))
  (list->tree (intersection-lists (tree->list tree1) (tree->list tree2))))

(display "intersection test\n")

(define a (list->tree '(5 7)))
(define w (intersection-sets x a))
w

