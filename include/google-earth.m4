  ## Google Earth
  ENV LD_LIBRARY_PATH /usr/lib32:/usr/lib/x86_64-linux-gnu/:$LD_LIBRARY_PATH

  ## prerequisites
  RUN apt-get install -y wget
 #RUN apt-get install -y msttcorefonts
  RUN apt-get install -y xdg-utils
  RUN apt-get install -y libc6-i386
  RUN apt-get install -y libglib2.0-0:i386
 #RUN apt-get install -y libglu1-mesa:i386
  RUN apt-get install -y libglu1-mesa
  RUN apt-get install -y libxext6:i386
  RUN apt-get install -y libxrender1:i386
  RUN apt-get install -y libx11-6:i386
  RUN apt-get install -y libfontconfig1:i386
  RUN apt-get install -y lsb-core

  ## Google Earth
  RUN wget -O /tmp/google-earth64.deb http://dl.google.com/dl/earth/client/current/google-earth-stable_current_amd64.deb
  RUN dpkg -i /tmp/google-earth64.deb
  RUN rm -f /tmp/google-earth64.deb
