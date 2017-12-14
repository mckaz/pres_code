#lang rosette


(define (increment_sec x) (if (= x 59) 0 (+ x 1)))

(define-symbolic x_in integer?)

(verify #:assume (assert (and (<= 0 x_in) (< x_in 60)))
        #:guarantee (assert (let ([ret (increment_sec x_in)]) (and (<= 0 ret) (< ret 60)))))



(define (set_time self s m h)
  (set-object-@sec! self s)
  (set-object-@min! self m)
  (set-object-@hour! self h))



(struct object
  ([classid]
   [@sec #:mutable]
   [@min #:mutable]
   [@hour #:mutable]))



(define (foo self x)
  (A_m x 42)
)



(let ([in 42])
  (assert (> 42 0))
  (define ret (m_uninterp x 42))
  (assume (> ret 0))
  ret) ;; precond



(let ([in 42])
  (havoc (object-@foo in))
  (define-symbolic ret integer?)
  (assume (> ret 0))
  ret) 


