(class +Topic +Entity)
(rel topicid (+Ref +Number))
(rel title (+Idx +String))
(rel posts (+List +Joint) topic (+Post))

(class +Post +Entity)
(rel topic (+Joint) posts (+Topic))
(rel content (+String))
