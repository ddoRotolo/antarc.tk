(setq *Thread (db 'threadid '+Thread (next)))

(setq *JS NIL)

(or *Thread (and (http404) (bye)))

(load "lib/common.l")

(html 0 "Antarc.tk" *Css NIL
   (topbar  '(("home" . "/index.l") ~(boardList)))
   (if (get *Thread 'locked) 
      (<h2> NIL "This thread has been locked, no further replies are allowed.") 
      (topForm (get *Thread 'board) *Thread T))
   (printhread *Thread T))
