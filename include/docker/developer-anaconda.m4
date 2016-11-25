  ## Anaconda

  ENV PATH /opt/conda/bin:$PATH
  RUN apt-get update &&       \
      apt-get install -y      \
        wget                  \
        wget bzip2            \
        wget ca-certificates  \
        libglib2.0-0          \
        libxext6              \
        libsm6                \
        libxrender1

  RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh && \
      wget --quiet https://repo.continuum.io/archive/Anaconda2-4.2.0-Linux-x86_64.sh -O ~/anaconda.sh && \
      /bin/bash ~/anaconda.sh -b -p /opt/conda && \
      rm ~/anaconda.sh

  ## update and install packages
  RUN conda update conda
  RUN conda install -y -c ioos            folium
  RUN conda install -y -c anaconda        basemap
  RUN conda install -y -c anaconda        beautiful-soup
  RUN conda install -y -c anaconda        csvkit
  RUN conda install -y -c asmeurer        dbf
  RUN conda install -y -c asmeurer        dbf
  RUN conda install -y -c anaconda        django
  RUN conda install -y -c asmeurer        ecdsa
  RUN conda install -y -c conda-forge     fiona
  RUN conda install -y -c anaconda        pillow
  RUN conda install -y -c anaconda        flask
  RUN conda install -y -c conda-forge     pandoc
  RUN conda install -y -c conda-forge     gdal
  RUN conda install -y -c anaconda        geotiff
  RUN conda install -y -c asmeurer        graphviz
  RUN conda install -y -c anaconda        hyde
  RUN conda install -y -c anaconda        hdf5
  RUN conda install -y -c anaconda        ipython
  RUN conda install -y -c anaconda        jupyter
  RUN conda install -y -c conda-forge     jupyter_console
  RUN conda install -y -c anaconda        jupyter_client
  RUN conda install -y -c anaconda        jupyter_core
  RUN conda install -y -c anaconda        libffi
  RUN conda install -y -c anaconda        libpq
  RUN conda install -y -c pandas          pandas
  RUN conda install -y -c anaconda        mkl
  RUN conda install -y -c anaconda        openblas
  RUN conda install -y -c ngould          paramiko
  RUN conda install -y -c anaconda        postgresql
 #RUN conda install -y -c anaconda        pyaudio
  RUN conda install -y -c anaconda        pyodbc
  RUN conda install -y -c ioos            geopandas
  RUN conda install -y -c jiminco         pyproj
  RUN conda install -y -c anaconda        pytables
  RUN conda install -y -c anaconda        pyzmq
  RUN conda install -y -c anaconda        scypy
  RUN conda install -y -c anaconda        numpy
  RUN conda install -y -c unidata         shapely
  RUN conda install -y -c anaconda        snuggs
  RUN conda install -y -c anaconda        spacey
  RUN conda install -y -c blaze           sqlite3
  RUN conda install -y -c dhirschfeld     sphinx
  RUN conda install -y -c anaconda        ujson
  RUN conda install -y -c anaconda        nltk
  RUN conda install -y -c trentonoliphant uuid
