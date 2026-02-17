#lang sicp

(define (list-at items n)
  (if (= n 0)
      (car items)
      (list-at (cdr items) (- n 1))))
(define squares (list 1 4 9 16 25))
(list-at squares 3)
