#Topic
#*Title
#Post
#*Content *Image

(when *Image
   (call "mv" (tmp *Image) "img/"))

(new! '(+Thread)
   'title *Title
   'threadid (genKey 'threadid '+Thread)
   'replies '()
   'op (new! '(+Post)
         'postid (genKey 'postid '+Post)
         'image *Image
         'content *Content))


(html 1 "Antarc.tk" *Css NIL
   (<h1> NIL "Posted")
   (<href> "Go back" "index.l"))
