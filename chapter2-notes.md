Running Scheme code:
- Install Scheme
  - `brew install --cask racket`
  - `raco pkg install sicp`
- Run REPL
  - `racket -I sicp` for the REPL
- Compile code
  - Create `.rkt` file with `#lang sicp` at the top
  - Run with `racket <filename>`


### Chapter 2.1 Notes
- Pair
  - Construct a pair with `cons`
  - Access first el with `car` and second el with `cdr`
    - `cdr` is pronounced "could-er"
  - Data objects constructed from pairs are called **list-structure data**
```scheme
(define x (cons 1 2))
(car x)
1
(cdr x)
2
```
```scheme
(define make-rat cons)
(define numer car)
(define denom cdr)
```
- Newline character and displaying text
```scheme
(define (print-rat x)
    (newline)
    (display (numer x))
    (display "/")
    (display (denom x)))
```
- Procedures as objects!!
  - The ability to represent procedures as objects allows us to represent compound data.
  - This style of programming is called **message passing**.
- Examples of message passing: Possible interesting ways to represent `cons`, `car`, `cdr`
```scheme
(define (cons x y)
    (define (dispatch m)
        (cond ((= m 0) x)
              ((= m 1) y)
              (else (error "Argument not 0 or 1: CONS" m))))
    dispatch)
(define (car z) (z 0))
(define (cdr z) (z 1))
```
```scheme
(define (cons x y)
    (lambda (m) (m x y)))
(define (car z)
    (z (lambda (p q) p)))
(define (cdr z)
    (z (lambda (p q) q)))
```

### Chapter 2.2 Notes
- **Closure property of cons** -> the ability to create pairs whose elements are pairs.
  - In general, an operation combining data objects satisfies the **closure property** if the results of combining things with the operation can themselves be combined using the same operation.
  - The set is CLOSED.
  - This apparently is distinct from the javascript notion of closure, which is a thing in Lisp but not mentioned in SICP.
- **List**
  - List is **DEFINED** in terms of cons
  - `nil` is the **empty list**
```scheme
(list 1 2 3 4)
```
```scheme
(cons 1
      (cons 2
            (cons 3
                  (cons 4 nil))))
```





