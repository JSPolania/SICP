#lang sicp
(#%require r5rs/init)

(car ''abracadabra)

;this is equivalent to

(car (quote (quote abracadabra)))

;the first quote transform the subsequent into a list (quote abracadabra), so the car returns the first element "quote"