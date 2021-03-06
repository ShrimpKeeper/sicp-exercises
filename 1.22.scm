(define (search-for-primes lower-limit limit)
  (define (iter cur)
    (if (<= cur limit) (timed-prime-test cur))
    (if (<= cur limit) (iter (+ cur 2))
      "done!"))
  (if (even? lower-limit)
    (iter (+ lower-limit 1))
    (iter lower-limit)))

(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
    (begin (newline)
    (display n)
    (report-prime (- (runtime) start-time)))))

(define (prime? n)
  (= n (smallest-devisor n)))

(define (smallest-devisor n)
  (smallest-devisor-iter 2 n))

(define (square x)
  (* x x))

(define (smallest-devisor-iter test-devisor n)
  (cond ((>= (square test-devisor) n)	n)
	((= (remainder n test-devisor) 0) test-devisor)
	(else (smallest-devisor-iter (+ test-devisor 1) n))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))
