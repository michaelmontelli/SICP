#lang sicp

(define (reverse items)
  (define (reverse-iter l r)
    (if (null? l)
        r
        (reverse-iter (cdr l) (cons (car l) r))))
  (reverse-iter items nil))
(reverse (list 1 2 3 4 5 6))
