(de prinpost ("post")
   (<p> '(class . post) 
      (prin (get "post" 'content) )))

(de printopic ("topic")
   (<h2> '(class . topic)
      (prin (get "topic" 'title)))
   (<ul> '(class . postlist)
      (mapcar prinpost (get "topic" 'posts) )))

(html 1 "Antarc.tk" *Css NIL
   (<div> '(id . topics)
      (mapcar printopic (collect 'topicid '+Topic) ))
   (<post> '(id . newTopic) "newTopic.l"
      (<label> NIL "Title:")
      (<field> 20 '*Title)
      (<br>)
      (<label> NIL "Post:")
      (<area> 20 10 '*Content)
      (<submit> "New Topic" "New Topic")))
