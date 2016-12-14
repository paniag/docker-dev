## Dockerfile for Uzbl
## Mac Radigan

include(`ubuntu.m4')dnl

include(`elasticsearch.m4')dnl

  ADD ./srv_ctl /usr/bin
  RUN chmod 775 /usr/bin/srv_ctl
  ENTRYPOINT ["/usr/bin/srv_ctl"]

include(`footer.m4')dnl
