(setq *Board (db 'abrev '+Board (next)))
(setq *Page (next))

(or *Board (http404) (bye))

(load "lib/common.l")

(html NIL "Antarc.tk" *Css NIL
   (topbar '(("home" . "/index.l") ~(boardList)))
   (topForm *Board)
   (<div> '(id . threads)
      (mapcar printhread 
         (head 
            10 
            (nth 
               (reverse
                  (by 
                     '(("t") 
                        (get (or (car (get "t" 'replies)) (get "t" 'op)) 'postid)) 
                     sort  
                     (get *Board 'threads))) 
               (+ 1 (* 10 (or *Page 0)))))))
  (<ul> '(id . pageNav)
     (unless (or (not *Page) (= *Page 0))
        (<li> '(class .pagelink)
           (<href> "<prev" (pack (url> *Board) "&+" (- *Page 1)))))
     (for "i" (+ 1 (/ (- (length (get *Board 'threads)) 1) 10))
        (<li> '(class . pagelink)
           (<href> "i" (pack (url> *Board) "&+" (- "i" 1)))))
     (unless (= *Page (/  (- (length (get *Board 'threads)) 1) 10))
        (<li> '(class .pagelink)
           (<href> "next>" (pack (url> *Board) "&+" (+ *Page 1)))))))
