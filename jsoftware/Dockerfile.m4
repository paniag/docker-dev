## Dockerfile for JSoftware ijconsole
## Mac Radigan

include(`ubuntu-base.m4')dnl

include(`curl.m4')dnl
include(`wget.m4')dnl

  RUN mkdir -p /usr/share/applications/
  RUN mkdir -p /usr/share/icons/hicolor/scalable/apps/

include(`jsoftware.m4')dnl

  # ijconsole entry point
  ENTRYPOINT ["/usr/bin/ijconsole"]

include(`footer.m4')dnl
