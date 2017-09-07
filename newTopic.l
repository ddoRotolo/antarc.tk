#Topic
#*Title
#Post
#*Content
(setq "topic" 
   (new! '(+Topic)
      'topicid (rand)
      'title *Title))

(new! '(+Post)
   'topic "topic"
   'content *Content)

(====)
(html 1 "Antarc.tk" *Css NIL
   (<h1> NIL "Posted")
   (<href> "Go back" "index.l"))
