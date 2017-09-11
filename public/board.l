(setq *Board (db 'abrev '+Board (next)))

(or *Board (http404) (bye))

(load "lib/common.l")

(html NIL "Antarc.tk" *Css NIL
   (topbar)
   (topForm *Board)
   (<div> '(id . threads)
      (prinboard *Board)))
