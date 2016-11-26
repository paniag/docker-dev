## Dockerfile for docker-dev-python
## Mac Radigan

include(`phusion.m4')dnl

include(`developer-basic.m4')dnl

include(`developer-anaconda.m4')dnl
  RUN echo 'PATH=/opt/conda/bin:$PATH' >> /etc/profile
  RUN echo 'PATH=/opt/conda/bin:$PATH' >> /etc/bash.bashrc
  RUN echo 'PATH=/opt/conda/bin:$PATH' >> /etc/zsh/zshrc

include(`userenv.m4')dnl

include(`clean.m4')dnl

include(`footer.m4')dnl
