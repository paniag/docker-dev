  ## Vimb

  RUN apt-get update &&              \
      apt-get install -y             \
        apt-utils                    \
        build-essential              \
        libwebkit-dev                \
        git

  RUN mkdir -p /opt
  RUN (cd /opt; git clone https://github.com/radiganm/vimb.git)
  RUN (cd /opt/vimb; make clean)
  RUN (cd /opt/vimb; make)
  RUN (cd /opt/vimb; make install)
