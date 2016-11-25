  ## PostGIS

  RUN apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8
  RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ jessie-pgdg main" > /etc/apt/sources.list.d/pgdg.list
  RUN apt-get -y update
  RUN apt-get -y install ca-certificates rpl pwgen

  RUN apt-get update &&  \
      apt-get install -y \
        software-properties-common \
          postgresql-9.5-postgis-2.2 \
          netcat

  EXPOSE 5432

  ADD ./boostrap.sh /tmp/boostrap.sh
  RUN bash /tmp/boostrap.sh
  RUN rm -f /tmp/boostrap.sh

  ADD ./start-postgis.sh /start-postgis.sh
  RUN chmod 0755 /start-postgis.sh

  CMD /start-postgis.sh
