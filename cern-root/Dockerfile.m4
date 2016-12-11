## Dockerfile for CERN Root
## Mac Radigan

include(`ubuntu.m4')dnl

include(`cern-root.m4')dnl

include(`clean.m4')dnl

  # CERN Root entry point
  ADD ./root_ctl /usr/bin
  RUN chmod 775 /usr/bin/root_ctl
  ENTRYPOINT ["/usr/bin/root_ctl"]

include(`footer.m4')dnl
