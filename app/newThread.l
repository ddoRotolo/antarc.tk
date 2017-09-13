#Topic
#*Title *BoardId
#Post
#*Content *Filename *Email *Name 
#Captcha
#*CaptchaFile *Captcha

(load "lib/common.l")

(setq *Board (db 'boardid '+Board (format *BoardId)))

(when (<> (in (pack "captcha/" *CaptchaFile) (read)) *Captcha)
   (redirect (if *Board (url> @) "/index.l"))
   (bye))

(and *Board *Title *Content *Filename 
   (redirect 
      (url> 
         (newThread! 
            *Board
            *Title 
            (newPost! 
               NIL 
               *Content 
               (newImage! *Filename)
               *Email 
               *Name)))))
