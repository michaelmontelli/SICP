Running Scheme code:
- Install Scheme
  - `brew install --cask racket`
  - `raco pkg install sicp`
- Run REPL
  - `racket -I sicp` for the REPL
- Compile code
  - Create `.rkt` file with `#lang sicp` at the top
  - Run with `racket <filename>`


### Chapter 1.1 Notes
- Can't wrap values in parentheses, otherwise Scheme will interpret as function call with no args
- Types of expression evaluation
  - **Normal-order evaluation** -> expand everything and then simplify
  - **Applicative-order evaluation** -> evaluate arguments, then apply
    - THIS IS WHAT SCHEME ACTUALLY USES
- Scheme Case analysis 
  - Has kind of pattern matching / switch statement feel
  - Ex: Absolute value function -> Exactly one case must apply or undefined behavior
    - x > 0 -> x
    - x = 0 -> 0
    - x < 0 -> -x
```scheme
(define (abs x)
    (cond ((> x 0) x)
          ((= x 0) 0)
          ((< x 0) (- x)))
```
  - Can define default case by adding `else`, never undefined
```scheme
(define (abs x)
    (cond ((> x 0) x)
          (else (- x)))
```
- Special Form
  - **special form** -> A special keyword in the language that **cannot** be defined as a procedure
    - Ex: `if`, `and`, `or` -> These all 
- if statement
  - Evaluates condition and then evaluates given appropriate expression given result
    - IMPORTANT: The fact that if is a special form actually matters!!!
      - We can rely on the branch that is not taken to not be evaluated
      - Important for recursion and not infinitely recursing
```scheme
(define (abs x)
    (if (< x 0)
        (- x)
        x))
```
- boolean operators
  - `and` and `or` are evaluated exactly in other languages, with eager stopping
    - Are **special forms**
  - `not`

### Chapter 1.2 Notes
- Tail Recursion
  - Iteration in Scheme is often implemented with recursion!!!
  - However, this does NOT mean that memory grows with each recursive call, like in C
  - Instead, Scheme is able to execute an iterative process in constant space, even when recursion is used.
    - This is called **tail recursive**.
- Order of growth with Theta notation
  - Let R(n) be the number of resources a process requires for problem of size n.
  - We say "R(n) has order of growth theta of f(n)", written `R(n) = Theta(f(n))` if:
    - There exist postive constants k1 and k2, independent of n, such that `k1f(n) <= R(n) <= k2f(n)` for all large n
- `remainder n 2` -> primitive procedure to get remainder, `n % 2`
- **Euclid's Algorithm** -> `GCD(a,b) = GCD(b,r)`, where b != 0 and `r = a % b`.


### Chapter 1.3 Notes
- **Higher-order procedure** -> Procedure that manipulates other procedures (as argument or return)



