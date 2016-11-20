## Dockerfile for docker-dev-full
## Mac Radigan

  FROM phusion/baseimage

  MAINTAINER Mac Radigan <mac@radigan.org>

  ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
  ENV PATH /opt/conda/bin:$PATH

  ## use baseimage-docker's init system
  CMD ["/sbin/my_init"]

  ## update APT
  RUN apt-get update --fix-missing

  ## basic tools
  RUN apt-get install -y xauth
  RUN apt-get install -y xterm
  RUN apt-get install -y wget
  RUN apt-get install -y curl
  RUN apt-get install -y vim
  RUN apt-get install -y vim-gnome
  RUN apt-get install -y zsh
  RUN apt-get install -y rlwrap
  RUN apt-get install -y screen
  RUN apt-get install -y tmux
  RUN apt-get install -y xclip 
  RUN apt-get install -y rxvt-unicode 

  ## CM tools
  RUN apt-get install -y git 
  RUN apt-get install -y mercurial
  RUN apt-get install -y subversion

  ## analysis basic
  RUN apt-get install -y ack-grep 
  RUN apt-get install -y gnuplot 
  RUN apt-get install -y graphviz 

  ## developer basic
  RUN apt-get install -y guile-2.0 
  RUN apt-get install -y guile-2.0-dev 
  RUN apt-get install -y sbcl 
  RUN apt-get install -y haskell-platform 
  RUN apt-get install -y pandoc 
  RUN apt-get install -y gpp 
  RUN apt-get install -y ditaa 

  ## Anaconda
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

  ## users
  RUN mkdir /home/dev && \
      mkdir /home/dev/.ssh && \
      chmod -f 700 /home/dev/.ssh && \
      mkdir /home/dev/.Xauthority && \
      chmod -f 700 /home/dev/.Xauthority && \
      useradd -d /home/dev -p dev dev

  ## passwords
  RUN echo "dev:dev"   | chpasswd
  RUN echo "root:root" | chpasswd

  ## SSH
  RUN rm -f /etc/service/sshd/down
  RUN /etc/my_init.d/00_regen_ssh_host_keys.sh
  ADD ./phusion-001.pub /tmp/phusion-001.pub
  RUN cat /tmp/phusion-001.pub >> /root/.ssh/authorized_keys 
  RUN cat /tmp/phusion-001.pub >> /home/dev/.ssh/authorized_keys
  RUN rm -f /tmp/phusion-001.pub

  # clean up APT
  RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

## *EOF*
