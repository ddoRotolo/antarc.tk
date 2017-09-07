#!/usr/bin/env pil

(load "@lib/http.l" "@lib/xhtml.l" "@lib/form.l")

(load "classes.l")

(pool "app.db")

(de main () 
   (server 8080 "index.l")  
   (wait))
