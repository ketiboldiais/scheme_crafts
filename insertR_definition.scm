#lang racket
;; string, string, list --> list
;; consumes stringA, stringB, listA, returns listB where:
;; if there is a match to stringB, insert immediately to right of stringB the stringA

;; (insertR 1 2 '(0 2 3 4)) --> '(0 1 2 3 4)
;; (insertR 1 2 '()) --> '()
;; (insertR 1 2 '(0 2) -->
;; '(cons 0 (1 2))
;; '(cons 0 (cons 1 (2))
;; '(cons 0 (cons 1 (cons 2 ('())))

;; (insertR e d (a b c d f g d h))
;; (cons a (insertR e d (b c d f g h))
;; (cons a (cons b (insertR e d (c b d f g h))
;; (cons a (cons b (cons e (b d f g h)
;; (cons a (cons b (cons e (cons b (insertR (d f g h)
;; (cons a (cons b (cons e (cons b (cons d (f g h))

;(define insertR
;  (lambda (atomA) (atomB) (listA)
;    ((null? listA) '())
;    (cond
;      (else
;       (cons ... atomA ... atomB
;        (cdr ... listA

(define insertR
  (lambda (A B l)
    (cond
      ((null? l) '())
      ((eq? B (car l)) (cons B (cons A (cdr l))))
      (else (cons (car l) (insertR A B (cdr l)))))))


(insertR "topping" "fudge" '("ice" "cream" "with" "fudge" "for" "dessert"))
(insertR "jalapeno" "and" '("tacos" "tamales" "and" "salsa"))
(insertR "e" "d" '("a" "b" "c" "d" "f" "g" "d" "h"))
(insertR "a" "b" '())