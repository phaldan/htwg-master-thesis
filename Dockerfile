FROM ubuntu:16.04

RUN apt-get update && \
  apt-get install -y latexmk texlive-latex-extra texlive-lang-english texlive-lang-german texlive-fonts-extra

WORKDIR /target

USER 1000:1000

ENTRYPOINT ["latexmk"]
