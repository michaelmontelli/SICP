#lang sicp

(define (fast-expt b n)
  (define (square x)
    (* x x))
  (define (fast-expt-iter b n a)
    (if (= n 0)
        a
        (if (= (remainder n 2) 1)
            (fast-expt-iter b (- n 1) (* b a))
            (fast-expt-iter b
                            (- n 2)
                            (* (square b) a)))))
  (fast-expt-iter b n 1))
(fast-expt 2 50)
