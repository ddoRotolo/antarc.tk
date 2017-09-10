#+Post
#*Thread *Content *Filename *Email *Name

(load "common.l")

(and *Thread *Content 
   (newPost! 
      (any *Thread) 
      *Content  
      (and *Filename (newImage! @))
      *Email 
      *Name))

(wait 1000)
(redirect (url> (any *Thread)))
