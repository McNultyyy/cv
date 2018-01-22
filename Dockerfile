FROM ubuntu:14.04

LABEL maintainer="william.mcnulty@live.co.uk"

RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y texlive-latex-base

WORKDIR /tmp
