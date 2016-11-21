## Dockerfile for google-earth
## Mac Radigan

include(`phusion.m4')dnl

include(`google-earth.m4')dnl

include(`clean.m4')dnl

  # Google Earth entry point
  ENTRYPOINT ["/usr/bin/google-earth"]

include(`userenv.m4')dnl

include(`footer.m4')dnl
