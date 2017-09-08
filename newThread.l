#Topic
#*Title *Board
#Post
#*Content *Image *Name *Email

(when *Image
   (call "mv" (tmp *Image) "img/"))

(new! '(+Thread)
   'title *Title
   'threadid (genKey 'threadid '+Thread)
   'board (and *Board (any @))
   'replies '()
   'op (new! '(+Post)
         'postid (genKey 'postid '+Post)
         'timestamp (stamp)
         'image *Image
         'email *Email
         'user *Name
         'content *Content))


(html 1 "Antarc.tk" *Css NIL
   (<h1> NIL "Posted")
   (<href> "Go back" (if *Board (url> (any @)) "index.l")))
