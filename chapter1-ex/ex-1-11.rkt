#lang sicp

(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1))
         (* 2
            (f (- n 2)))
         (* 3
            (f (- n 3))))))
(define (f-iter n)
  (define (ff a b c last-computed)
    (if (= last-computed n)
        a
        (ff (+ a
               (* 2 b)
               (* 3 c))
            a
            b
            (+ last-computed 1))))
  (if (< n 3)
      n
      (ff 2 1 0 2)))
(f 25)
(f-iter 25)
