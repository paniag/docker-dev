  ## Google Earth
  ENV LD_LIBRARY_PATH /usr/lib32:/usr/lib/x86_64-linux-gnu/:$LD_LIBRARY_PATH

  ## prerequisites
  RUN dpkg --add-architecture i386
  RUN apt-get update &&       \
      apt-get install -y      \
        wget                  \
        xdg-utils             \
        libc6-i386            \
        libglu1-mesa          \
        libxext6:i386         \
        libxrender1:i386      \
        libx11-6:i386         \
        libfontconfig1:i386   \
        libglib2.0-0:i386     \
        lsb-core

 #RUN apt-get install -y libglu1-mesa:i386
 #RUN apt-get install -y msttcorefonts

  ## Google Earth
  RUN wget -O /tmp/google-earth64.deb http://dl.google.com/dl/earth/client/current/google-earth-stable_current_amd64.deb
  RUN dpkg -i /tmp/google-earth64.deb
  RUN rm -f /tmp/google-earth64.deb
