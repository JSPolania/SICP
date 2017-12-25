(define nil '())
;using pure recursion without higher order procedures
(define (tree-map1 f tree)
    (cond
        ((null? tree) nil)
        ((pair? tree)
            (cons (tree-map1 f (car tree))
                (tree-map1 f (cdr tree))))
        (else (f tree))))

(define (square-tree1 tree) (tree-map1 square tree))

;using map
(define (tree-map2 f tree)
    (map (lambda (sub-tree)
        (if (pair? sub-tree)
            (tree-map2 f sub-tree)
            (f sub-tree)))
        tree))

(define (square-tree2 tree) (tree-map2 square tree))

(define x (list 1 (list 2 ( list 3 4) 5) (list 6 7)))
