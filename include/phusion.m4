  FROM phusion/baseimage

  MAINTAINER Mac Radigan <mac@radigan.org>

  ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

  ## use baseimage-docker's init system
  CMD ["/sbin/my_init"]

  ## update APT
  RUN apt-get update --fix-missing

  ## basic tools
  RUN apt-get install -y xauth

  ## SSH
  RUN rm -f /etc/service/sshd/down
  RUN /etc/my_init.d/00_regen_ssh_host_keys.sh
