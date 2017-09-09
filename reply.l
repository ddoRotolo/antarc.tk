#+Post
#*Thread *Content *Filename

(load "common.l")

(newPost! 
   (any *Thread) 
   *Content  
   (and *Filename (newImage! @))
   *Email 
   *Name)

(wait 1000)
(redirect (url> (any *Thread)))
