FROM ubuntu:24.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      latexmk \
      texlive-latex-recommended \
      texlive-latex-extra \
      texlive-fonts-recommended \
      texlive-bibtex-extra && \
    rm -rf /var/lib/apt/lists/*
WORKDIR /data
ENTRYPOINT ["latexmk", "-pdf"]
