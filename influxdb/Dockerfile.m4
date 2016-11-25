## Dockerfile for httpd
## Mac Radigan

include(`phusion.m4')dnl

include(`influxdb.m4')dnl

  ## InfluxDB entry point
  ENTRYPOINT ["/usr/bin/influxd"]

include(`footer.m4')dnl
