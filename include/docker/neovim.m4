  ## Neovim

  RUN apt-get update &&  \
      apt-get install -y \
        software-properties-common \
        apt-utils

  RUN add-apt-repository ppa:neovim-ppa/unstable && \
      apt-get update &&  \
      apt-get install -y \
        apt-utils \
        neovim \
        python-dev \
        python-pip \
        python3-dev \
        python3-pip

#       python-properties-common  
