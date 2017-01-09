## Dockerfile for gnss
## Mac Radigan

include(`ubuntu.m4')dnl

include(`gnss-sdr.m4')dnl

  ADD ./sdr_ctl /usr/local/bin
  RUN chmod 775 /usr/local/bin/sdr_ctl
  ENTRYPOINT ["/usr/local/bin/sdr_ctl"]

include(`footer.m4')dnl
