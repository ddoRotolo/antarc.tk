(de topForm ("board" "thread" "reply?")
   (<div> '(id . header) 
      (<h1> NIL (ht:Prin (get "board" 'title)))
      (<post> '(id . newThread) (if "reply?" "/app/reply.l" "/app/newThread.l")
         (<hidden> '*BoardId (get "board" 'boardid))
         (<hidden> '*ThreadId (get "thread" 'threadid))
         (<h2> NIL (ht:Prin (if "reply?" "Post Reply" "Make a new Thread")))
         (<p> NIL "Fields with an \'*\' are required for posting")
         (<label> NIL "Name:")
         (<field> NIL '*Name)
         (<br>)
         (<label> NIL "Email:")
         (<field> NIL '*Email)
         (<br>)
         (<label> NIL (ht:Prin (if "reply?" "Subject" "*Title:")))
         (<field> NIL '*Title)
         (<br>)
         (<label> NIL "*Post:")
         (<area> NIL 6 '*Content)
         (<br>)
         (<label> NIL (ht:Prin (if "reply?" "Image:" "*Image:")))
         (<upload> 250000 '*Filename)
         (<br>)
         (let "captcha" (genCaptcha "board" "thread")
            (<hidden> '*CaptchaFile "captcha")
            (<p> NIL "Please type in the letters and numbers displayed below:")
            (<tag> "pre" '(id . captcha) 
               (prinCaptcha "board" "thread" "captcha")))
         (<label> NIL "Captcha:")
         (<field> NIL '*Captcha)
         (<submit> (if "reply?" "New Reply" "New Thread")))))

(de captchaPath (*Board *Thread "captchaid")
   (pack "captcha/" (get *Board 'abrev) (get *Thread 'threadid) "captchaid"))

(de genCaptcha (*Board *Thread)
    "Returns the Path to the Captcha File"
    (setq "captchaid" (in "/dev/urandom" (rd 8)))
    (setq "solution" (pipe (call "pwgen" "-A" "-B" "4" "1") (read)))
    (out (captchaPath *Board *Thread "captchaid") (prin "solution"))
    "captchaid")

(de prinCaptcha (*Board *Thread "captchaid")
   (in 
      (captchaPath *Board *Thread "captchaid")
      (pipe 
         (call "toilet" "-s" "-f" "bigascii12" (read)) 
         (echo))))

(de checkCaptcha (*Board *Thread "captchaid" *Captcha) 
   (= (in (captchaPath *Board *Thread "captchaid") (read)) *Captcha))

(de delCaptcha (*Board *Thread "captchaid")
   (call "rm" "-f" (captchaPath *Board *Thread "captchaid")))

(de prinpost ("post")
   (<div> 
      '((class . post) (id . (pack "p" (get "post" 'postid))))
      (<h4> '(class . postInfo)
         (ht:Prin 
            (or (get "post" 'user) "Anonymous") " "
            "["(get "post" 'timestamp) "] ")
         (<href> 
            (pack "No." (get "post" 'postid))
            (url> "post")))
      (when (get "post" 'image)
         (<h4> '(class . fileInfo)
            (ht:Prin "File: ") 
            (<href> (url> @) (url> @ T T) ) 
            (ht:Prin
               " " (/ (get @ 'filesize) 1024) "Kb " (get @ 'filename)))
         (<img> (url> @ T) NIL (url> @ T T)))
      (<p> '(class . postContent) 
         (ht:Prin (get "post" 'content)))))

(de printhread ("thread" "hideView?")
   (<div> '(class . thread)
      (<h2> '(class . threadTitle)
         (ht:Prin (get "thread" 'title)))
      (<div> '(class . op)  
         (prinpost (get "thread" 'op))
         (or "hideView?" 
            (<span> '(class . threadView) 
               (let "l" (length (get "thread" 'replies))
                  (cond 
                     ((= "l" 5) (ht:Prin "1 Post Omitted."))
                     ((> "l" 5) (ht:Prin (- "l" 4) " Posts Omitted "))
                     (T T)))
               (<href> "View Thread" (url> "thread")))))
      (<ul> '(class . replies)
         (for "post" 
            (by
               '(("p") (get "p" 'postid))
               sort
               (ifn "hideView?" 
                  (head 4 (get "thread" 'replies))
                  (get "thread" 'replies)))
            (<li> '(class . reply)
               (prinpost "post")))))) 

(de boardList ()
   (mapcar 
      '(("b") 
         (cons (get "b" 'abrev) (url> "b")))
      (collect 'boardid '+Board)))

(de topbar ("lst") 
   (<div> '(id . topbar)
      (<ul> NIL 
         (for "l" "lst"
            (<li> '(class . boardabrev) 
               (<href> (car "l") (cdr "l")))))))

(de newImage! (*Filename)
   (let ("id" (genKey 'imgid '+Image)
         "type" (pack (last (split (chop *Filename) "."))))
      (call "mv" (tmp *Filename) (pack "img/" "id" "." "type"))
      (call 
         "gm" "convert" (pack "img/" "id" "." "type") 
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
