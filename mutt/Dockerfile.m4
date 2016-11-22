## Dockerfile for Mutt
## Mac Radigan

include(`ubuntu.m4')dnl

include(`mutt.m4')dnl

include(`clean.m4')dnl

  # Mutt
  ENTRYPOINT ["/usr/bin/mutt"]

include(`footer.m4')dnl
