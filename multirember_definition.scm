#lang racket

;; multirember
;; atom, lat --> lat
;; consumes an atom, and a lat, returns a lat with all instances of atom removed
;; (multirember a '(a b c d)) --> (b c d)
;(cons b ( cons c (cons d '())))


;; (multirember a '(a b c a d e f)) --> (b c d e f)
;(cons b (cons c (cons d '())))

; (multirember a (a b c a d e f))
; (cons b (multirember a (b c a d e f)))
; (cons b (cons c (multirember a (a d e f)))
; (cons b (cons c (cons d (multirember a (e f))))
; (cons b (cons c (cons d (cons e (multirember (f)))))
; (cons b (cons c (cons d (cons e (cons f (multirember a '())))

;; (multirember a '()) --> '()
;'()


;; (multirember a '(a a a b) --> '(b)
;(cons b '())



;(define multirember
;  (lambda (a lat)
;    (cond
;      ((null? lat) '())
;      (else ... a ... lat))))


(define multirember
  (lambda (a lat)
    (cond
      ((null? lat) '())
      (else (cond
              ((eq? (car lat) a) (multirember a (cdr lat)))
              (else (cons (car lat) (multirember a (cdr lat)))))))))
              
;; Test
(multirember "a" '("a" "b" "c" "e" "a" "d"))

