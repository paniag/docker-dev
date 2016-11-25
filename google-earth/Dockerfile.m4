## Dockerfile for google-earth
## Mac Radigan

include(`ubuntu.m4')dnl

include(`google-earth.m4')dnl

include(`clean.m4')dnl

  ## Google Earth entry point
  ENTRYPOINT ["/usr/bin/google-earth"]

include(`footer.m4')dnl
