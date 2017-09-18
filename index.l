(load "lib/common.l")

(html 0 "Antarc.tk" *Css NIL
   (topbar (boardList))
   (<div> '(id . header)
      (<h1> NIL "Antarc.tk"))
   (<div> '(id . news)
      (<h2> NIL "News"))
   (<div> '(id . latestPosts)
      (<h2> NIL "Latest Posts")
      (<ul> NIL
         (mapcar 
            '(("t") 
               (let "p" (or (car (get "t" 'replies))
                     (get "t" 'op))
                  (prinpost "p"))) 
            (head 
               12
               (reverse
                  (by 
                     '(("t") 
                        (get 
                           (or 
                              (car (get "t" 'replies)) 
                              (get "t" 'op)) 
                           'postid)) 
                     sort  
                     (collect 'threadid '+Thread))))))))
