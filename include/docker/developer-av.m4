  ## AV tools
  RUN apt-get update &&            \
      apt-get install -y           \
        jackd1                     \
        qjackctl                   \
        mesa-utils                 \
        timidity                   \
        timidity-interfaces-extra
