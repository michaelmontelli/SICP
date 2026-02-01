#lang sicp

(define (filtered-accumulate
          combiner null-value term a next b filter?)
  (cond ((> a b) null-value)
        ((filter? a) (combiner (term a)
                               (filtered-accumulate
                                 combiner
                                 null-value
                                 term
                                 (next a)
                                 next
                                 b
                                 filter?)))
        (else (filtered-accumulate
                combiner
                null-value
                term
                (next a)
                next
                b
                filter?))))

(define (identity x) x)
(define (add x y) (+ x y))
(define (sum term a next b)
  (filtered-accumulate
    add 0 term a next b identity))

(define (inc n) (+ n 1))
(define (sum-cubes a b)
  (define (cube x) (* x x x))
  (sum cube a inc b))

(sum-cubes 1 10)

