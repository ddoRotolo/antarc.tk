(de prinpost ("post")
   (<div> '(class . post)
      (<h4> '(class . postInfo)
            (prin 
               (or (get "post" 'user) "Anonymous") " "
               "("(get "post" 'timestamp) ") "
               "No." (get "post" 'postid)))
      (when (get "post" 'image)
         (<h4> '(class . fileInfo)
            (prin 
               "File: " (<href> (pack (get @ 'imgid) "." (get @ 'filetype)) (url> @ T)) 
               " (" (/ (get @ 'filesize) 1024) "Kb " (get @ 'filename) ")"))
         (<img> (url> @) NIL (url> @ T)))
      (<p> '(class . postContent) 
         (prin  (get "post" 'content)))))

(de printhread ("thread" "hideView?")
   (<div> '(class . thread)
      (<h2> '(class . threadTitle)
         (prin (get "thread" 'title)))
      (<div> '(class . op)  
         (prinpost (get "thread" 'op))
         (or "hideView?" 
            (<span> '(class . threadView) 
               (prin (- (length (get "thread" 'replies)) 4) " Posts Omitted. ")
               (<href> "View Thread" (url> "thread")))))
      (<ul> '(class . replies)
         (for "post" 
            (reverse 
               (ifn "hideView?" 
                  (head 4 (get "thread" 'replies))
                  (get "thread" 'replies)))
            (<li> '(class . reply)
               (prinpost "post")))))) 



(de prinboard ("board")
   (mapcar printhread 
      (head 
         10 
         (reverse
            (by 
               '(("t") 
                  (get (car (get "t" 'replies)) 'postid)) 
               sort  
               (collect 'threadid '+Thread))))))

(de topbar ()
   (<ul> '(id . topbar)
      (for "board" (collect 'boardid '+Board)
         (<li> '(id . boardabrev) 
            (<href> (get "board" 'abrev) 
               (url> "board"))))))

(de newImage! (*Filename)
   (let ("id" (genKey 'imgid '+Image)
         "type" (pack (last (split (chop *Filename) "."))))
      (call "mv" (tmp *Filename) (pack "img/" "id" "." "type"))
      (call 
         "convert" (pack "img/" "id" "." "type") 
         "-resize" "160x160" 
         (pack "thumb/" "id" "." "type"))
      (new! '(+Image)
         'imgid "id"
         'filesize (car (info (pack "img/" "id" "." "type")))
         'filetype "type"
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

(de newBoard! ("title" "abrev")
   (new! '(+Board)
      'title "title"
      'abrev "abrev"
      'boardid (genKey 'boardid '+Board)))
