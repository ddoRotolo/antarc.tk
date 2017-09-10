(load "common.l")

(html 0 "Antarc.tk" *Css NIL
   (<ul> '(id . topbar)
      (for "board" (collect 'boardid '+Board)
         (<li> '(id . boardabrev) 
            (<href> (get "board" 'abrev) 
               (url> "board")))))
   (<div> '(id . header)
      (<h1> NIL "Antarc.tk"))
   (<div> '(id . posts)
      (<h2> NIL "Latest Posts")
      (mapcar prinpost 
         (head 
            20 
            (reverse
               (by 
                  '(("p") (get "p" 'postid)) 
                  sort  
                  (collect 'postid '+Post)))))))
