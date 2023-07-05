FROM ubuntu
RUN apt -y update && apt install -y --no-install-recommends latexmk texlive-formats-extra texlive-bibtex-extra
WORKDIR /data
ENTRYPOINT latexmk -pdf