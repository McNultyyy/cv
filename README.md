## CV 

I'm using this both as a chance to learn Travis-CI and refresh my LaTeX skills.

[![Build Status](https://travis-ci.org/McNultyyy/cv.svg?branch=master)](https://travis-ci.org/McNultyyy/cv)
## Build Process
1. Push updates.
2. Travis-CI builds _tex_ files into a _pdf_.
3. Output _pdf_ is then pushed into the [travis-build](https://github.com/mcnultyyy/cv/tree/travis-build) branch.


## Run
```
docker run -it --rm --volume "$(pwd):/tmp:rw" texlive pdflatex main
```