(setq *Thread (db 'threadid '+Thread (any (next))))

(or *Thread (http404) (bye))

(load "common.l")

(html 0 "Antarc.tk" *Css NIL
   (topbar)
   (topForm NIL *Thread T)
   (printhread *Thread T))
