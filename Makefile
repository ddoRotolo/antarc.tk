run: .pw img thumb
	pil app.l -main +

.pw:
	pil @lib/http.l -'pw 12' -bye

img:
	mkdir img

thumb:
	mkdir thumb

reset:
	rm -f .pw app.db 
	rm -rf img thumb

