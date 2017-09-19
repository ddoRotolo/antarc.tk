#!/usr/bin/env pil

(load "@lib/http.l" "@lib/xhtml.l")

(allowed '("css/" "fonts/" "app/" "public/" "thumb/" "img/") 
   "*Gate" "*Adr"
   "index.l" "!psh"
   "*BoardId" "*ThreadId"
   "*Title" "*Content" "*Filename"
   "*Name" "*Email"
   "*Captcha" "*CaptchaFile")

(load "classes.l" "lib/common.l")

(setq *Css '("css/reset.css" "css/layout.css" "fonts/fonts.css"))

(pool "app.db")

(task -3600000 0 (call "git" "pull"))

(de main () 
   (server 8080 "index.l")
   (wait))
