  ## Anaconda
  RUN apt-get install -y wget
  RUN apt-get install -y wget bzip2
  RUN apt-get install -y wget ca-certificates
  RUN apt-get install -y libglib2.0-0
  RUN apt-get install -y libxext6
  RUN apt-get install -y libsm6
  RUN apt-get install -y libxrender1
  RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh && \
      wget --quiet https://repo.continuum.io/archive/Anaconda2-4.2.0-Linux-x86_64.sh -O ~/anaconda.sh && \
      /bin/bash ~/anaconda.sh -b -p /opt/conda && \
      rm ~/anaconda.sh
