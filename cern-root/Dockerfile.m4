## Dockerfile for CERN Root
## Mac Radigan

include(`ubuntu.m4')dnl

include(`cern-root.m4')dnl

include(`clean.m4')dnl

  # CERN Root entry point
  ENTRYPOINT ["/usr/bin/root"]

include(`footer.m4')dnl
