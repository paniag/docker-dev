  ## KAFKA

  RUN apt-get update &&              \
      apt-get install -y             \
        software-properties-common   \
        apt-utils                    \
        wget

  RUN wget -qO - http://packages.confluent.io/deb/3.0/archive.key | apt-key add -
  RUN add-apt-repository "deb [arch=amd64] http://packages.confluent.io/deb/3.0 stable main"
  RUN apt-get update &&              \
      apt-get install -y             \
        confluent-platform-2.11
