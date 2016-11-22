## Dockerfile for Steel Bank Common Lisp (SBCL)
## Mac Radigan

include(`ubuntu-base.m4')dnl

  RUN apt-get update &&       \
      apt-get install -y      \
        sbcl

  # SBCL entry point
  ENTRYPOINT ["/usr/bin/sbcl"]

include(`footer.m4')dnl
