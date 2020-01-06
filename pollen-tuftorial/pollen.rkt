#lang racket
(require txexpr pollen/decode pollen/tag)
(provide (all-defined-out))

(define-tag-function (root attrs els)
  (txexpr 'article null
          (decode-elements els #:txexpr-proc smart-quotes)))

(define-tag-function (section attrs els)
  (txexpr 'section attrs (decode-paragraphs els)))

(define (heading heading-tag text)
  (txexpr*
   heading-tag
   `((id ,(string-replace(string-downcase text) " " "-")))
   text))

(define-tag-function (title attrs els)
  `(@ ,(heading 'h1 (first els)) ,(apply subtitle null (rest els))))


(define (sectioner heading-tag attrs els)
  (apply section attrs (cons (heading heading-tag (first els))
                             (rest els))))

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


(define-tag-function (sans attrs els)
  (txexpr 'span (cons '(class "sans") attrs) els))


(define-tag-function (sidenote attrs els)
  (define sidenote-id (format "sn-id-~a" (eq-hash-code els)))
  `(@
    (label ((for ,sidenote-id) (class "margin-toggle sidenote-number")))
    (input ((type "checkbox")(id ,sidenote-id)(class "margin-toggle")))
    (span ((class "sidenote")) ,@els)))


(define-tag-function (marginnote attrs els)
  (define marginnote-id (format "mn-id-~a" (eq-hash-code els)))
  `(@
    (label ((for ,marginnote-id) (class "margin-toggle")) 8853)
    (input ((type "checkbox")(id ,marginnote-id)(class "margin-toggle")))
    (span ((class "marginnote")) ,@els)))


(define-tag-function (figure attrs els)
  (txexpr
   'figure
   null
   (append els
           (list (txexpr 'img `((src ,(attr-ref attrs 'src))
                                (alt ,(attr-ref attrs 'alt))) null)))))

(define-tag-function (figure-fullwidth attrs els)
  (attr-join (apply figure attrs els) 'class "fullwidth"))


(define-tag-function (youtube attrs els)
  `(figure ((class "iframe-wrapper"))
          (iframe ((width "853")
                   (height "480")
                   (src ,(string-append "https://www.youtube.com/embed/" (attr-ref attrs 'id)))
                   (frameborder "0")
                   (allowfullscreen "true")))))

(define-tag-function (epigraph attrs els)
  (match-define (list paras ... footer-para) (decode-paragraphs els))
  (txexpr* 'div
          '((class "epigraph"))
  (txexpr 'blockquote
          attrs
          (append paras
                  (list (txexpr 'footer null (get-elements footer-para)))))))