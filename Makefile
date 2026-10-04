RESUME := AmrAbed
TEX_FILES := $(RESUME).tex $(wildcard sections/*.tex) $(wildcard *.bib) $(wildcard *.cls)

TINYTEX_DARWIN := $(HOME)/Library/TinyTeX/bin/universal-darwin
TINYTEX_LINUX := $(HOME)/.TinyTeX/bin/x86_64-linux

LATEXMK_DIR := $(shell if command -v latexmk >/dev/null 2>&1; then dirname "$$(command -v latexmk)"; \
                 elif [ -x "$(TINYTEX_DARWIN)/latexmk" ]; then echo "$(TINYTEX_DARWIN)"; \
                 elif [ -x "$(TINYTEX_LINUX)/latexmk" ]; then echo "$(TINYTEX_LINUX)"; \
                 fi)

.PHONY: all resume build docker-build clean distclean

all: resume

resume: $(RESUME).pdf

build: $(RESUME).pdf

$(RESUME).pdf: $(TEX_FILES)
	@if [ -n "$(LATEXMK_DIR)" ]; then \
		echo "Building $(RESUME).pdf using local latexmk..."; \
		PATH="$(LATEXMK_DIR):$$PATH" latexmk -pdf $(RESUME).tex; \
	elif command -v docker >/dev/null 2>&1; then \
		echo "Building $(RESUME).pdf using Docker..."; \
		docker compose run --rm latexmk $(RESUME).tex; \
	else \
		echo "Error: Neither latexmk nor docker found on system." >&2; \
		exit 1; \
	fi

docker-build:
	docker compose run --rm latexmk $(RESUME).tex

clean:
	@if [ -n "$(LATEXMK_DIR)" ]; then \
		PATH="$(LATEXMK_DIR):$$PATH" latexmk -c $(RESUME).tex 2>/dev/null || true; \
	fi
	rm -f *.aux *.log *.out *.bbl *.blg *.fls *.fdb_latexmk bu*.aux bu*.bbl bu*.blg bu*.out

distclean: clean
	rm -f $(RESUME).pdf
