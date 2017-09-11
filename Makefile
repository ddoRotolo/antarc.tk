run: .pw img thumb captcha
	pil app.l -main +

.pw:
	pil @lib/http.l -'pw 12' -bye

img:
	mkdir img

thumb:
	mkdir thumb

captcha:
	mkdir captcha

reset:
	rm -f .pw app.db 
	rm -rf img thumb

