run: .pw img
	pil app.l -main

.pw:
	pil @lib/http.l -'pw 12' -bye

reset:
	rm -f .pw app.db

img:
	mkdir img
