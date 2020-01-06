#lang info
(define collection "pollen-tuftorial")
(define scribblings '(("scribblings/pollen-tuftorial.scrbl" (multi-page))))
(define deps '("base" "pollen" "hyphenate" "css-tools" "txexpr" "sugar" "scribble-lib"))
(define build-deps '("rackunit-lib" "racket-doc" "scribble-doc"))
(define update-implies '("txexpr" "hyphenate" "sugar"))
(define test-omit-paths (list #rx"\\.(pm|ptree|pp)$"))