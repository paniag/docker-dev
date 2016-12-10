## Dockerfile for sumo
## Mac Radigan

include(`ubuntu.m4')dnl

include(`sumo.m4')dnl

  ADD ./sumo_ctl /usr/local/bin
  RUN chmod 775 /usr/local/bin/sumo_ctl
  ENTRYPOINT ["/usr/local/bin/sumo_ctl"]

include(`footer.m4')dnl
