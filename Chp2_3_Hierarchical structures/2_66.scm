#lang sicp  (#%require r5rs/init)
;using wishfull thinking for selectors and constructor 
;(key record) return the key of a record
;(left-record record) returns the left branch of a record
;(right-record record) returns the right bracn of a record

(define (lookup given-key set-of-records)
  cond ((null? set-of-records) false)
       ((= given-key (key record) (data-of-record record)))
       ((< given-key (key-record) (lookup given-key (left-record record))))
       ((> given-key (key-record) (lookup given-key (right-record record)))))

