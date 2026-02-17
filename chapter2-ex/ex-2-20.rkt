#lang sicp

(define (get-parity n) (remainder n 2))

(define (same-parity first . rest)
  (define (same-parity-as-first? x)
    (= (get-parity first) (get-parity x)))

  (define (filter-parity lst)
    (cond ((null? lst) nil)
          ((same-parity-as-first? (car lst))
           (cons (car lst) (filter-parity (cdr lst))))
          (else (filter-parity (cdr lst)))))

  (cons first (filter-parity rest)))

(same-parity 5 4 3 2 1)
