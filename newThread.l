#Topic
#*Title *Board
#Post
#*Content *Filename *Email *Name 

(load "common.l")

(and *Board *Title *Content *Filename 
   (newThread! 
      (any *Board)
      *Title 
      (newPost! 
         NIL 
         *Content 
         (newImage! *Filename)
         *Email 
         *Name)))

(wait 1000)
(redirect (if *Board (url> (any @)) "index.l"))
