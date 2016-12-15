## Dockerfile for Uzbl
## Mac Radigan

include(`ubuntu.m4')dnl

include(`hydrogen.m4')dnl

  ENTRYPOINT ["/usr/bin/hydrogen"]

include(`footer.m4')dnl
