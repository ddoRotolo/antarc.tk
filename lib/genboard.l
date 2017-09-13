(load "classes.l" "lib/common.l")

(pool "app.db")

(de boards 
   ("Minimalism" "mn") 
   ("Technology" "tech")
   ("Programming" "prog")
   ("Questions" "q"))

(for "b" boards
   (newBoard! (car "b") (cadr "b")))

(bye)
