## Dockerfile for Haskell Platform
## Mac Radigan

include(`ubuntu.m4')dnl

include(`haskell-platform.m4')dnl

  ENTRYPOINT ["/usr/bin/ghci"]

include(`footer.m4')dnl
