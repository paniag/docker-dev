## Dockerfile for docker-dev-basic
## Mac Radigan

  FROM phusion/baseimage

  MAINTAINER Mac Radigan <mac@radigan.org>

  ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

  ## use baseimage-docker's init system
  CMD ["/sbin/my_init"]

  ## update APT
  RUN apt-get update --fix-missing

  ## basic tools
  RUN apt-get install -y xauth
  RUN apt-get install -y zsh
  RUN apt-get install -y vim
  RUN apt-get install -y vim-gnome
  RUN apt-get install -y screen
  RUN apt-get install -y wget
  RUN apt-get install -y curl

  ## CM tools
  RUN apt-get install -y git 

  ## users
  RUN useradd -d /home/dev -s /bin/zsh -p dev dev

  ## passwords
  RUN echo "dev:dev"   | chpasswd
  RUN echo "root:root" | chpasswd

  ## SSH
  RUN rm -f /etc/service/sshd/down
  RUN /etc/my_init.d/00_regen_ssh_host_keys.sh

  # clean up APT
  RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

## *EOF*
