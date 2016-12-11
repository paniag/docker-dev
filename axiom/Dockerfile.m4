## Dockerfile for Axiom
## Mac Radigan

include(`ubuntu.m4')dnl

include(`axiom.m4')dnl

include(`clean.m4')dnl

  # CERN Root entry point
  ADD ./axiom_ctl /usr/bin
  RUN chmod 775 /usr/bin/axiom_ctl
  ENTRYPOINT ["/usr/bin/axiom_ctl"]

include(`footer.m4')dnl
