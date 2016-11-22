## Dockerfile for Neovim
## Mac Radigan

include(`ubuntu.m4')dnl

include(`neovim.m4')dnl

include(`clean.m4')dnl

  # Neovim
  ENTRYPOINT ["/usr/bin/neovim"]

include(`footer.m4')dnl
