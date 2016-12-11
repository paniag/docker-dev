  ## MongoDB

  RUN apt-get update &&              \
      apt-get install -y             \
        software-properties-common   \
        apt-utils                    \
        mongodb                      \
        wget
