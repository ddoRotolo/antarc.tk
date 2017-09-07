(class +Thread +Entity)
(rel threadid (+Ref +Number))
(rel title (+String))
(rel op (+Link) NIL (+Post))
(rel replies (+List +Joint) thread (+Post))

(class +Post +Entity)
(rel postid (+Ref +Number))
(rel content (+String))
(rel image (+String))
(rel thread (+Joint) replies (+Thread))

