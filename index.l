(load "lib/common.l")

(html 0 "Antarc.tk" *Css NIL
   (topbar (boardList))
   (<div> '(id . header)
      (<h1> NIL "Antarc.tk"))
   (<div> '(id . posts)
      (<h2> NIL "Latest Posts")
      (<ul> NIL
         (mapcar 
            '(("p") 
               (<li> NIL
                  (ht:Prin (get "p" 'postid) ":" (get "p" 'content)))) 
            (head 
               20 
               (reverse
                  (by 
                     '(("p") (get "p" 'postid)) 
                     sort  
                     (collect 'postid '+Post))))))))
