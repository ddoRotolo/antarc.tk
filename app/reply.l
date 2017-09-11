#+Post
#*Thread *Content *Filename *Email *Name
#Captcha
#*CaptchaFile *Captcha

(when (<> (in (pack "captcha/" *CaptchaFile) (read)) *Captcha)
   (redirect (if *Board (url> (any @)) "/index.l"))
   (bye))

(load "lib/common.l")

(and *Thread *Content 
   (newPost! 
      (any *Thread) 
      *Content  
      (and *Filename (newImage! @))
      *Email 
      *Name))

(wait 1000)
(redirect (url> (any *Thread)))
