  ## Anaconda
  ENV PATH /opt/conda/bin:$PATH
  RUN apt-get update &&       \
      apt-get install -y      \
        wget                  \
        wget bzip2            \
        wget ca-certificates  \
        libglib2.0-0          \
        libxext6              \
        libsm6                \
        libxrender1
  RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh && \
      wget --quiet https://repo.continuum.io/archive/Anaconda2-4.2.0-Linux-x86_64.sh -O ~/anaconda.sh && \
      /bin/bash ~/anaconda.sh -b -p /opt/conda && \
      rm ~/anaconda.sh
