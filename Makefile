run: .pw img
	pil app.l -main +

.pw:
	pil @lib/http.l -'pw 12' -bye

img:
	mkdir img

reset:
	rm -f .pw app.db 
	rm -rf img

