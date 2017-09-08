(class +Board +Entity)
(rel boardid (+Key +Number))
(rel title (+String))
(rel abrev (+String))
(rel threads (+List +Joint) board (+Thread))

(class +Thread +Entity)
(rel threadid (+Key +Number))
(rel title (+String))
(rel op (+Ref +Link) NIL (+Post))
(rel replies (+List +Joint) thread (+Post))
(rel board (+Joint) threads (+Board))

(class +Post +Entity)
(rel postid (+Key +Number))
(rel content (+String))
(rel thread (+Joint) replies (+Thread))
(rel image (+String))

