FROM ubuntu:14.04

LABEL maintainer="william.mcnulty@live.co.uk"

RUN rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y texlive-latex-base texlive-latex-extra texlive-fonts-recommended
#RUN tlmgr init-usertree
#RUN tlmgr install moderncv

WORKDIR /tmp
