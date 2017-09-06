(load "@lib/http.l" "@lib/xhtml.l")

(de start '()
   (server 8080 "index.l"))

(start)
(wait)
