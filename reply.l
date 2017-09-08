#+Post
#*Content *Thread *Image

(html 1 "Antarc.tk" *Css NIL
   (<h1> NIL "Posted")
   (<href> "Go back" "index.l"))

(when *Image
   (call "mv" (tmp *Image) "img/"))

(new! '(+Post) 
  'postid (genKey 'postid '+Post)
  'thread (any *Thread)
  'image *Image
  'content *Content)

