(de prinpost ("post")
   (<li> '(class . post) 
      (<p> '(class . postContent) (prin (get "post" 'content)))))

(de printopic ("topic")
   (<div> '(class . topic)
      (<h2> '(class . topicTitle)
         (prin (get "topic" 'title)))
      (<ul> '(class . postlist)
         (mapcar prinpost (get "topic" 'posts) ))
      
      (<href> "reply to this thread" "iunno")))

(html 1 "Antarc.tk" *Css NIL
   (<post> '(id . newTopic) "newTopic.l"
      (<label> NIL "Title:")
      (<br>)
      (<field> 20 '*Title)
      (<br>)
      (<label> NIL "Post:")
      (<br>)
      (<area> 20 10 '*Content)
      (<br>)
      (<submit> "New Topic" "New Topic") )
   (<div> '(id . topics)
      (mapcar printopic (collect 'topicid '+Topic))))
