(de prinpost ("post")
   (<div> '(class . post)
      (<div> '(class . postInfo)
         (prin 
            (get "post" 'user) " "
            "("(get "post" 'timestamp) ") "
            "No: " (get "post" 'postid)))
      (when (get "post" 'image)
         (<img> (pack "img/" @)))
      (<p> NIL (prin  (get "post" 'content)))))

(de printhread ("thread")
   (<div> '(class . thread)
      (<h2> '(class . threadTitle)
         (prin (get "thread" 'title)))
      (<div> '(class . op)  
         (prinpost (get "thread" 'op)))
      (<ul> '(class . replies)
         (for "post" (reverse  (get "thread" 'replies))
            (<li> '(class . reply)
               (prinpost "post")))))) 

(de topbar ()
   (<ul> '(id . topbar)
      (for "board" (collect 'boardid '+Board)
         (<li> '(id . boardabrev) 
            (<href> (get "board" 'abrev) 
               (url> "board"))))))

(de newPost! (*Thread *Content *Image *Email *Name)
   (new! '(+Post) 
      'postid (genKey 'postid '+Post)
      'timestamp (stamp)
      'thread *Thread
      'content *Content 
      'user *Name
      'email *Email
      'image *Image))

(de newThread! (*Board *Title *Post)
   (new! '(+Thread)
      'threadid (genKey 'threadid '+Thread)
      'board *Board 
      'title *Title
      'op *Post))
