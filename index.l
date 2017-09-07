(de prinpost ("post")
   (<p> '(class . post)
      (get "post" 'content)))

(de printhread ("thread")
   (<div> '(class . thread)
      (<h2> '(class . threadTitle)
         (prin (get "thread" 'title)))
      (prinpost (get "thread" 'op))))

(html 1 "Antarc.tk" *Css NIL
   (<post> '(id . newThread) "newThread.l"
      (<label> NIL "Title:")
      (<br>)
      (<field> 20 '*Title)
      (<br>)
      (<label> NIL "Post:")
      (<br>)
      (<area> 20 10 '*Content)
      (<br>)
      (<submit> "New Thread" "New Thread") )
   (<div> '(id . threads)
      (mapcar printhread (collect 'threadid '+Thread))))
