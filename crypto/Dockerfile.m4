## Dockerfile for Uzbl
## Mac Radigan

include(`ubuntu.m4')dnl

include(`crypto.m4')dnl

  ADD ./crypto_ctl /usr/bin
  RUN chmod 775 /usr/bin/crypto_ctl
  ENTRYPOINT ["/usr/bin/crypto_ctl"]

include(`footer.m4')dnl
