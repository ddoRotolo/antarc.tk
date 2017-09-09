#+Post
#*Content *Thread *Image

(load "common.l")

(when *Image
   (call "mv" (tmp *Image) "img/"))

(newPost! (any *Thread) *Content *Image *Email *Name)

(wait 1000)
(redirect 1000 (url> (any *Thread)))
