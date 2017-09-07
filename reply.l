#+Post
#*Content *Thread

(html 1 "Antarc.tk" *Css NIL
   (<h1> NIL "Posted")
   (<p> NIL (show *Thread))
   (<href> "Go back" "index.l"))

(new! '(+Post) 
  'postid (genKey 'postid '+Post)
  'thread (any *Thread)
  'content *Content)

