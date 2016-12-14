## Dockerfile for Uzbl
## Mac Radigan

include(`ubuntu.m4')dnl

include(`vimb.m4')dnl

  ENTRYPOINT ["/usr/local/bin/vimb"]

include(`footer.m4')dnl
