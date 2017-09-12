#Topic
#*Title *Board
#Post
#*Content *Filename *Email *Name 
#Captcha
#*CaptchaFile *Captcha

(load "lib/common.l")

(when (<> (in (pack "captcha/" *CaptchaFile) (read)) *Captcha)
   (redirect (if *Board (url> (any @)) "/index.l"))
   (bye))

(and *Board *Title *Content *Filename 
   (newThread! 
      (any *Board)
      *Title 
      (newPost! 
         NIL 
         *Content 
         (newImage! *Filename)
         *Email 
         *Name)))

(wait 1000)
(redirect (if *Board (url> (any @)) "/index.l"))
