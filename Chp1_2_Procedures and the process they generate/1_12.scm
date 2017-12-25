(define (pascal n k)
    ;n = row of triangle 0 < n
    ;k = k position in row n, 0 < k <= n
    (if (or (= k 0)(= k n))
        1
        (+ (pascal (- n 1)(- k 1))(pascal (- n 1) k))))



