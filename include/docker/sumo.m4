  ## SUMO

  RUN apt-get update &&              \
      apt-get install -y             \
        build-essential              \
        git                          \
        libxerces-c-dev

  RUN mkdir -p /opt
  RUN (cd /opt; git clone https://github.com/radiganm/sumo.git)
  RUN (cd /opt/sumo; ./configure)
  RUN (cd /opt/sumo; make)
  RUN (cd /opt/sumo; make install)

# # SUMO entry point
# ENTRYPOINT ["/usr/local/bin/netconvert"]
# ENTRYPOINT ["/usr/local/bin/sumo"]
