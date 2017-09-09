(load "common.l")

(html 0 "Antarc.tk" *Css NIL
   (<ul> '(id . topbar)
      (for "board" (collect 'boardid '+Board)
         (<li> '(id . boardabrev) 
            (<href> (get "board" 'abrev) 
               (url> "board")))))
   (<div> '(id . header)
      (<h1> NIL "Antarc.tk"))
   (<div> '(id . threads)
      (mapcar printhread (collect 'threadid '+Thread))))
