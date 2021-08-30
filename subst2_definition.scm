#lang racket
;; subst2
	;; atom, atom, atom, list --> list

	;; consumes atom1, atom2, atom3, and list
		;; if there is a first occurrence of atom2, replace atom2 with atom1
		;; else, if there is a first occurrence of atom3, replace atom3 with atom1
		;; return the list with atom2 or atom3 replaced with atom1

	;; Examples
		;; (subst2 a b c '()) --> '()
		;; (subst2 a b c '(e f b d e))  --> '(e f a d e)
		;; (subst2 a b c '(e f c d e))  --> '(e f a d e)
		;; (subst2 a b c '(e f b d c))  --> '(e f a d c)

		;; Elaborated Examples
			;(subst2 a b c '(e b c))
			;(e a c)
			;(cons e (cons a (cons c)))

			;(subst2 a b c '(e d c))
			;(e d a)
			;(cons e (cons d (cons a)))

	;; Template
	; (define subst2
	;  (lambda n o1 o2 (l)
	;    ((null? l) '())
	;    (cond
	;      (... n ... o1 ... o2
	;      (else subst2 ...

(define subst
  (lambda (n first second l)
    (cond
      ((null? l) '())
      ((or (eq? first (car l)) (eq? second (car l))) (cons n (cdr l)))
      (else (cons (car l) (subst n first second (cdr l)))))))

;; Tests
(subst "a" "b" "c" '("e" "b" "c"))
(subst "vanilla" "chocolate" "banana" '("banana" "ice" "cream" "with" "chocolate" "topping"))







