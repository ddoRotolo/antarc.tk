(setq *Thread (db 'threadid '+Thread (next)))

(setq *JS NIL)

(or *Thread (and (http404) (bye)))

(load "lib/common.l")

(html 0 "Antarc.tk" *Css NIL
   (topbar  '(("home" . "/index.l") ~(boardList)))
   (if (get *Thread 'locked) 
      (<h2> '(id . header) "This thread has been locked, you may not reply at this time.") 
      (topForm (get *Thread 'board) *Thread T))
   (printhread *Thread T))
