#Topic
#*Title
#Post
#*Content

(new! '(+Post)
   'topic 
   (new! '(+Topic)
      'topicid (rand)
      'title *Title)
   'content *Content)

(html 1 "Antarc.tk" *Css NIL
   (<h1> NIL "Posted")
   (<href> "Go back" "index.l"))
