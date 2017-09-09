(de prinpost ("post")
   (<div> '(class . post)
      (<div> '(class . postInfo)
         (prin 
            (or (get "post" 'user) "Anonymous") " "
            "("(get "post" 'timestamp) ") "
            "No." (get "post" 'postid)))
      (when (get "post" 'image)
         (<img> (pack "img/" @)))
      (<p> '(class . postContent) (prin  (get "post" 'content)))))

(de printhread ("thread" "hideView?")
   (<div> '(class . thread)
      (<h2> '(class . threadTitle)
         (prin (get "thread" 'title)))
      (<div> '(class . op)  
         (prinpost (get "thread" 'op))
         (or "hideView?" (<href> "View Thread" (url> "thread"))))
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

(de newImage! (*Filename)
   (call "mv" (tmp *Filename) "img/")
   (let "id" (genKey 'imageid '+Image)
      (call 
         "convert" (pack "img/" *Filename) 
         "-resize" "160x160" 
         (pack "thumb/" "id"))
      (new! '(+Image)
         'imgid "id"
         'filesize (car (info (pack "img/" *Filename)))
         'filename *Filename)))

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
