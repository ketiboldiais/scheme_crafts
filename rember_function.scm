#lang racket
(define atom?
  (lambda (x)
    (and (not (pair? x)) (not (null? x)))))

(define rember
  (lambda (a lat)
    (cond
      ((null? lat) (quote()))
      (else (cond
              ((eq? (car lat) a) (cdr lat))
              (else (cons (car lat)
                    (rember a
                       (cdr lat)))))))))


(rember "tomato" '("bacon" "lettuce" "and" "tomato"))




