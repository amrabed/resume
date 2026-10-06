FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      latexmk \
      texlive-xetex \
      texlive-latex-recommended \
      texlive-latex-extra \
      texlive-fonts-recommended \
      texlive-fonts-extra \
      texlive-bibtex-extra \
      fonts-font-awesome && \
    rm -rf /var/lib/apt/lists/*
WORKDIR /data
ENTRYPOINT ["latexmk", "-xelatex"]
