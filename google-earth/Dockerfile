## Dockerfile for google-earth
## Mac Radigan

  FROM ubuntu:latest

  MAINTAINER Mac Radigan <mac@radigan.org>

  ## update APT
  RUN dpkg --add-architecture i386
  RUN apt-get update --fix-missing

  ENV PATH /usr/lib/x86_64-linux-gnu/:$PATH

  ## prerequisites
 #RUN apt-get install -y msttcorefonts
  RUN apt-get install -y wget
  RUN apt-get install -y xdg-utils
  RUN apt-get install -y libc6-i386
  RUN apt-get install -y libglib2.0-0:i386
  RUN apt-get install -y libglu1-mesa:i386
  RUN apt-get install -y libxext6:i386
  RUN apt-get install -y libxrender1:i386
  RUN apt-get install -y libx11-6:i386
  RUN apt-get install -y libfontconfig1:i386
  RUN apt-get install -y lsb-core

  ## Google Earth
  RUN wget -O /tmp/google-earth64.deb http://dl.google.com/dl/earth/client/current/google-earth-stable_current_amd64.deb
  RUN dpkg -i /tmp/google-earth64.deb
  RUN rm -f /tmp/google-earth64.deb
 #RUN wget -O /tmp/google-earth32.deb http://dl.google.com/dl/earth/client/current/google-earth-stable_current_i386.deb
 #RUN dpkg -i /tmp/google-earth32.deb
 #RUN rm -f /tmp/google-earth32.deb

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

  # clean up APT
  RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

  # Google Earth entry point
  ENTRYPOINT ["/usr/bin/google-earth"]

## *EOF*
