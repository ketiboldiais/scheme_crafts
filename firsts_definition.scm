#lang racket

(define firsts
  (lambda (l)
    (cond ((null? l) '())
          (else (cons (car (car l)) (firsts (cdr l)))))))

(firsts '((1 2 3) (3 4 5) (5 6 7)))


