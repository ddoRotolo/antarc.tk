(setq *Thread (db 'threadid '+Thread (any (next))))

(setq *JS NIL)

(or *Thread (http404) (bye))

(load "lib/common.l")

(html 0 "Antarc.tk" *Css NIL
   (topbar)
   (topForm NIL *Thread T)
   (printhread *Thread T))
