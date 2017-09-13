#+Post
#*ThreadId *Content *Filename *Email *Name
#Captcha
#*CaptchaFile *Captcha

(setq *Thread (db 'threadid '+Thread (format *ThreadId)))

(when (<> (in (pack "captcha/" *CaptchaFile) (read)) *Captcha)
   (redirect (if *Thread (url> *Thread) "/index.l"))
   (bye))

(load "lib/common.l")

(and *Thread *Content 
   (newPost! 
      *Thread 
      *Content  
      (and *Filename (newImage! @))
      *Email 
      *Name))

(wait 1000)
(redirect (url> *Thread))
