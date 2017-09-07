run: .pw
	pil app.l -main

.pw:
	pil @lib/http.l -'pw 12' -bye

reset:
	rm -f .pw test.db
