#!/usr/bin/env pil

(load "@lib/http.l" "@lib/xhtml.l" "@lib/form.l")

(load "classes.l")

(setq *Css '("css/reset.css" "css/layout.css"))

(pool "app.db")

(de newBoard! ("title" "abrev")
   (new! '(+Board)
      'title "title"
      'abrev "abrev"
      'boardid (genKey 'boardid '+Board)))

(de main () 
   (server 8080 "index.l")
   (wait))
