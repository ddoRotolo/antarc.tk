#!/usr/bin/env pil

(load "@lib/http.l" "@lib/xhtml.l" "@lib/form.l")

(allowed '("css/" "fonts/"))

(load "classes.l" "common.l")

(setq *Css '("css/reset.css" "css/layout.css" "fonts/fonts.css"))

(pool "app.db")

(de main () 
   (server 8080 "index.l")
   (wait))
