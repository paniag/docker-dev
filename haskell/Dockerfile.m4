## Dockerfile for Haskell Platform
## Mac Radigan

include(`ubuntu.m4')dnl

include(`haskell-platform.m4')dnl

include(`clean.m4')dnl

  # Haskell ghci entry point
  ENTRYPOINT ["/usr/bin/ghci"]

include(`footer.m4')dnl
