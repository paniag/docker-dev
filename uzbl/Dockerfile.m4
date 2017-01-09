## Dockerfile for Uzbl
## Mac Radigan

include(`ubuntu.m4')dnl

include(`uzbl.m4')dnl

  ONBUILD ADD ./uzbl_ctl /usr/bin
  ONBUILD RUN chmod 775 /usr/bin/uzbl_ctl
  ONBUILD ENTRYPOINT ["/usr/bin/uzbl_ctl"]

include(`footer.m4')dnl
