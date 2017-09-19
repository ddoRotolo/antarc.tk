#Topic
#*Title *BoardId
#Post
#*Content *Filename *Email *Name 
#Captcha
#*CaptchaFile *Captcha

(load "lib/common.l")

(setq *Board (db 'boardid '+Board (format *BoardId)))

(when (not (checkCaptcha *Board NIL *CaptchaFile *Captcha))
   (delCaptcha *Board NIL *CaptchaFile)
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


