## Dockerfile for Uzbl
## Mac Radigan

include(`ubuntu.m4')dnl

include(`uzbl.m4')dnl

  ADD ./uzbl_ctl /usr/bin
  RUN chmod 775 /usr/bin/uzbl_ctl
  ENTRYPOINT ["/usr/bin/uzbl_ctl"]

include(`footer.m4')dnl
