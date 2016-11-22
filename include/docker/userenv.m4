  ## passwords
  RUN echo "root:root" | chpasswd

  ## users
  RUN mkdir -p /home/dev && useradd -d /home/dev -s /bin/zsh -p dev dev

  ## default user
  USER dev
  RUN echo "set -o vi" >> /etc/bash.bashrc
