## Dockerfile for MongoDB
## Mac Radigan

include(`ubuntu.m4')dnl

include(`mongodb.m4')dnl

  ADD ./mongodb_ctl /usr/local/bin
  RUN chmod 775 /usr/local/bin/mongodb_ctl
  ENTRYPOINT ["/usr/local/bin/mongodb_ctl"]

include(`footer.m4')dnl
