  ## HTTPD

  RUN apt-get update &&              \
      apt-get install -y             \
        apache2                      \
        w3m                          \
        lynx                         \
        elinks                       \
        telnet                       \
        libapache2-mod-wsgi          \
        libapache2-mod-php

#       libapache2-mod-python         

 #      libapache2-mod-proxy-html     

  RUN a2enmod rewrite             && \
      a2enmod proxy_http          && \
      a2enmod proxy_wstunnel      && \
      a2enmod headers             && \
      a2enmod proxy_html          && \
      a2enmod xml2enc

  RUN mkdir -p /etc/my_init.d
  ADD httpd.sh /etc/my_init.d/httpd.sh
