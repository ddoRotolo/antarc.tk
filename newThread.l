#Topic
#*Title *Board
#Post
#*Content *Image *Email *Name 

(load "common.l")

(when *Image
   (call "mv" (tmp *Image) "img/"))

(newThread! 
   (and *Board (any @)) 
   *Title 
   (newPost! NIL *Content *Image *Email *Name))

(wait 1000)
(redirect (if *Board (url> (any @)) "index.l"))
