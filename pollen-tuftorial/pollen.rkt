#lang debug racket
(require txexpr pollen/decode pollen/tag)
(provide (all-defined-out))

(define-tag-function (root attrs els)
  (txexpr 'article null
          (decode-elements els #:txexpr-proc smart-quotes)))

(define-tag-function (section attrs els)
  (txexpr 'section attrs (decode-paragraphs els)))

(define-tag-function (title attrs els)
  `(@ (h1 ,attrs ,(first els)) ,(apply subtitle null (rest els))))


(define (sectioner level attrs els)
  (apply section attrs (cons (list level (first els)) (rest els))))

(define-tag-function (section-h1 attrs els) (sectioner 'h1 attrs els))
(define-tag-function (section-h2 attrs els) (sectioner 'h2 attrs els))
(define-tag-function (section-h3 attrs els) (sectioner 'h3 attrs els))

(define (link url . els)
  (txexpr 'a (list `(href ,url)) els)) 

(define-tag-function (subtitle attrs els)
  (txexpr 'p (list '(class "subtitle")) els))

(define (harden-quotes str)
  (for/list ([m (in-list (regexp-match* #rx"'|\"" str #:gap-select? #true))])
            (match m
              ["\"" 'quot]
              ["'" 'apos]
              [_ m])))

(define-tag-function ($ attrs els)
  (decode (txexpr 'code attrs els)
          #:string-proc harden-quotes))

(define-tag-function ($$ attrs els)
  (txexpr 'pre attrs (list (apply $ attrs els))))

(define-tag-function (blockquote attrs els)
  (match-define (list paras ... footer-para) (decode-paragraphs els))
  (txexpr 'blockquote
          attrs
          (append paras
                  (list `(footer ,(apply link (attr-ref attrs 'cite) (get-elements footer-para)))))))


(define-tag-function (newthought attrs els)
  (txexpr 'span (list '(class "newthought")) els))