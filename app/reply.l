#+Post
#*ThreadId *Content *Filename *Email *Name
#Captcha
#*CaptchaFile *Captcha

(load "lib/common.l")

(setq *Thread (db 'threadid '+Thread (format *ThreadId)))
(setq *Board (get *Thread 'board))

(when 
   (or 
      (get *Thread 'locked) 
      (not (checkCaptcha *Board *Thread *CaptchaFile *Captcha)))
   (delCaptcha *Board *Thread *CaptchaFile)
   (redirect (if *Thread (url> *Thread) "/index.l"))
   (bye))


(and *Thread *Content 
   (newPost! 
      *Thread 
      *Content  
      (and *Filename (newImage! @))
      *Email 
      *Name))

(wait 1000)
(redirect (url> *Thread))
