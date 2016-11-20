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
  RUN apt-get install -y screen
  RUN apt-get install -y wget
  RUN apt-get install -y curl

  ## CM tools
  RUN apt-get install -y git 

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
