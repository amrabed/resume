.PHONY: build clean resume

TEX_FILE := AmrAbed.tex

build:
	docker compose run latexmk $(TEX_FILE)

clean:
	rm -f *.aux *.log *.out *.bbl *.blg *.fls *.fdb_latexmk  # workaroud since the -c option is not working
	docker compose down && docker container prune -f && docker rmi latexmk

resume: build clean