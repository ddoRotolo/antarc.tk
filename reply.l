#+Post
#*Thread *Content *Filename

(load "common.l")

(newPost! (any *Thread) *Content *Filename *Email *Name)

(wait 1000)
(redirect (url> (any *Thread)))
