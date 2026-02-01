#lang sicp

(define (accumulate
          combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate
                  combiner null-value term (next a) next b))))
(define (accumulatei
          combiner null-value term a next b)
  (define (accumulate-iter a result)
    (if (> a b)
        result
        (accumulate-iter (next a)
                         (combiner (term a)
                                  result))))
  (accumulate-iter a null-value))

(define (add x y) (+ x y))
(define (sum term a next b)
  (accumulate
    add 0 term a next b))
(define (inc n) (+ n 1))
(define (sum-cubes a b)
  (define (cube x) (* x x x))
  (sum cube a inc b))


(define (sumi term a next b)
  (accumulatei
    add 0 term a next b))
(define (sum-cubesi a b)
  (define (cube x) (* x x x))
  (sumi cube a inc b))

(sum-cubes 1 10)
(sum-cubesi 1 10)
