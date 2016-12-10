## Dockerfile for sumo
## Mac Radigan

include(`ubuntu.m4')dnl

include(`sumo.m4')dnl

  ADD ./sumoctl /usr/local/bin
  RUN chmod 775 /usr/local/bin/sumoctl
  ENTRYPOINT ["/usr/local/bin/sumoctl"]

include(`footer.m4')dnl
