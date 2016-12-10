## Dockerfile for Kafka
## Mac Radigan

include(`ubuntu.m4')dnl

include(`kafka.m4')dnl

  ADD ./kafka_ctl /usr/local/bin
  RUN chmod 775 /usr/local/bin/kafka_ctl
  ENTRYPOINT ["/usr/local/bin/kafka_ctl"]

include(`footer.m4')dnl
