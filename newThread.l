#Topic
#*Title *Board
#Post
#*Content *Filename *Email *Name 

(load "common.l")

(newThread! 
   (and *Board (any @)) 
   *Title 
   (newPost! 
      NIL 
      *Content 
      (and *Filename (newImage! @)) 
      *Email 
      *Name))

(wait 1000)
(redirect (if *Board (url> (any @)) "index.l"))
