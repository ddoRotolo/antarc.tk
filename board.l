(setq *Board (db 'abrev '+Board (next)))

(or *Board (http404) (bye))

(load "common.l")

(html NIL "Antarc.tk" *Css NIL
   (topbar)
   (topForm)
   (<div> '(id . threads)
      (prinboard *Board)))
