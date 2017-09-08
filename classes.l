(class +Thread +Entity)
(rel threadid (+Key +Number))
(rel title (+String))
(rel op (+Ref +Link) NIL (+Post))
(rel replies (+List +Joint) thread (+Post))

(class +Post +Entity)
(rel postid (+Key +Number))
(rel content (+String))
(rel thread (+Joint) replies (+Thread))
(rel image (+String))

