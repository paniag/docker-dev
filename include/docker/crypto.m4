  ## Crypto

  RUN apt-get update &&              \
      apt-get install -y             \
        software-properties-common   \
        apt-utils                    \
        build-essential              \
        dh-autoreconf                \
        git

  RUN mkdir -p /opt/source/openssl
  RUN (cd /opt/source; git clone https://github.com/radiganm/openssl.git)
  RUN (cd /opt/source/openssl; ./config && make && make install)

  RUN mkdir -p /opt/source/gnupg
  RUN (cd /opt/source; git clone https://github.com/radiganm/gnupg.git)
  RUN (cd /opt/source/gnupg; autoconf && ./configure && make && make install)
