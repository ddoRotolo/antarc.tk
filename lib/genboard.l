(load "classes.l" "lib/common.l")

(pool "app.db")

(setq LoremIpsum 
   "Nulla cursus auctor tortor ut blandit. 
   Sed vestibulum leo metus, sit amet maximus leo bibendum eu. 
   Vestibulum eget leo in sem efficitur laoreet. 
   Vestibulum vehicula dui vitae commodo rhoncus. 
   Fusce ligula erat, convallis vitae vestibulum vel, porttitor ac purus. 
   Aenean id vulputate risus, eget rutrum est. 
   Mauris ligula augue, sagittis ac facilisis ac, feugiat eget lacus. 
   Curabitur finibus, erat sed egestas aliquet, urna dui scelerisque erat, 
   a gravida augue urna ac velit. 
   Etiam ornare ex eget ligula mollis, quis mattis dui ultricies. 
   Fusce non enim justo. Sed eget dolor justo.")

(setq TestImg "quitegoodwallpaper.jpg")

(de boards 
   ("Minimal" "mn") 
   ("Cyberpunk" "cyb")
   ("Technology" "tech")
   ("Cute" "c")
   ("Programming" "prog")
   ("Humanity" "hum")
   ("Questions" "q")
   ("Visual Arts" "vis")
   ("Videogames" "v"))

(for "b" boards
   (let "board" (newBoard! (car "b") (cadr "b"))
      (for "i" 10
         (let "thread" 
            (newThread! "board" (pack "Thread: " "i") 
               (newPost! 
                  NIL 
                  LoremIpsum 
                  (newImage! 
                     (and 
                        (call "cp" TestImg (tmp TestImg)) 
                        TestImg))))
            (for "j" 10 
               (newPost!
                  "thread"
                  (pack "Post: " "j")))))))

(bye)
