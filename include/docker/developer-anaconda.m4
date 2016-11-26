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
        libxrender1           \
        texlive               \
        texlive-latex-extra   \
        texlive-science       \
        texlive-full          \
        libgeos-dev           \
        git                   \
        python3-pip           \
        python-pip

  RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh && \
      wget --quiet https://repo.continuum.io/archive/Anaconda2-4.2.0-Linux-x86_64.sh -O ~/anaconda.sh && \
      /bin/bash ~/anaconda.sh -b -p /opt/conda && \
      rm ~/anaconda.sh

  ## update and install packages

  ## conda
  RUN conda update conda

  RUN conda install -y -c anaconda        basemap          && \
      conda install -y -c anaconda        beautiful-soup   && \
      conda install -y -c anaconda        csvkit           && \
      conda install -y -c anaconda        django           && \
      conda install -y -c anaconda        flask            && \
      conda install -y -c anaconda        geotiff          && \
      conda install -y -c anaconda        hdf5             && \
      conda install -y -c anaconda        hyde             && \
      conda install -y -c anaconda        ipython          && \
      conda install -y -c anaconda        jupyter          && \
      conda install -y -c anaconda        jupyter_client   && \
      conda install -y -c anaconda        jupyter_core     && \
      conda install -y -c anaconda        libffi           && \
      conda install -y -c anaconda        libpq            && \
      conda install -y -c anaconda        mkl              && \
      conda install -y -c anaconda        nltk             && \
      conda install -y -c anaconda        numpy            && \
      conda install -y -c anaconda        openblas         && \
      conda install -y -c anaconda        pillow           && \
      conda install -y -c anaconda        postgresql       && \
      conda install -y -c anaconda        pyodbc           && \
      conda install -y -c anaconda        pytables         && \
      conda install -y -c anaconda        pyzmq            && \
      conda install -y -c anaconda        scipy            && \
      conda install -y -c anaconda        scrapy           && \
      conda install -y -c anaconda        snuggs           && \
      conda install -y -c anaconda        sympy            && \
      conda install -y -c anaconda        ujson
 #RUN conda install -y -c anaconda        pyaudio
  
  RUN conda install -y -c asmeurer        dbf              && \
      conda install -y -c asmeurer        ecdsa            && \
      conda install -y -c asmeurer        graphviz
  
  RUN conda install -y -c blaze           sqlite
  
  RUN conda install -y -c conda-forge     fiona             && \
      conda install -y -c conda-forge     gdal              && \
      conda install -y -c conda-forge     jupyter_console   && \
      conda install -y -c conda-forge     pandoc
  
  RUN conda install -y -c dhirschfeld     sphinx
  
  RUN conda install -y -c ioos            folium            && \
      conda install -y -c ioos            geopandas         && \
      conda install -y -c ioos            vincent
  
  RUN conda install -y -c jiminco         pyproj
  
  RUN conda install -y -c ngould          paramiko
  
  RUN conda install -y -c pandas          pandas
  
  RUN conda install -y -c trentonoliphant nbconvert         && \
      conda install -y -c trentonoliphant nbpresent         && \
      conda install -y -c trentonoliphant notebook          && \
      conda install -y -c trentonoliphant uuid
  
  RUN conda install -y -c unidata         shapely
  
# RUN conda install -y python=3
  RUN conda create  -y --name py   python
  RUN conda create  -y --name py3  python=3
  RUN conda create  -y --name py35 python=3.5
# RUN source activate py35
# RUN ipython kernelspec install-self
#
#
  RUN pip  install --upgrade pip
  RUN pip3 install --upgrade pip

  RUN python2 -m pip install ipykernel
  RUN python2 -m ipykernel install --user
  RUN python3 -m pip install ipykernel
  RUN python3 -m ipykernel install --user

  ## pip

  RUN python3 -m pip install              csvkit            && \
      python3 -m pip install              dbf               && \
      python3 -m pip install              dbf               && \
      python3 -m pip install              django            && \
      python3 -m pip install              ecdsa             && \
      python3 -m pip install              fiona             && \
      python3 -m pip install              flask             && \
      python3 -m pip install              folium            && \
      python3 -m pip install              gdal              && \
      python3 -m pip install              geopandas         && \
      python3 -m pip install              gpxpy             && \
      python3 -m pip install              graphviz          && \
      python3 -m pip install              hyde              && \
      python3 -m pip install              ipython           && \
      python3 -m pip install              jupyter           && \
      python3 -m pip install              jupyter_client    && \
      python3 -m pip install              jupyter_console   && \
      python3 -m pip install              jupyter_core      && \
      python3 -m pip install              nbconvert         && \
      python3 -m pip install              nbpresent         && \
      python3 -m pip install              nltk              && \
      python3 -m pip install              notebook          && \
      python3 -m pip install              numpy             && \
      python3 -m pip install              pandas            && \
      python3 -m pip install              pandoc            && \
      python3 -m pip install              pillow            && \
      python3 -m pip install              pyproj            && \
      python3 -m pip install              pyzmq             && \
      python3 -m pip install              scipy             && \
      python3 -m pip install              shapely           && \
      python3 -m pip install              snuggs            && \
      python3 -m pip install              sphinx            && \
      python3 -m pip install              sympy             && \
      python3 -m pip install              ujson             && \
      python3 -m pip install              uuid              && \
      python3 -m pip install              vincent

 #RUN python3 -m pip install              basemap
 #RUN python3 -m pip install              beautiful-soup
 #RUN python3 -m pip install              geotiff
 #RUN python3 -m pip install              hdf5
 #RUN python3 -m pip install              libffi
 #RUN python3 -m pip install              libpq
 #RUN python3 -m pip install              mkl
 #RUN python3 -m pip install              openblas
 #RUN python3 -m pip install              paramiko
 #RUN python3 -m pip install              postgresql
 #RUN python3 -m pip install              pyaudio
 #RUN python3 -m pip install              pyodbc
 #RUN python3 -m pip install              pytables
 #RUN python3 -m pip install              scrapy
 #RUN python3 -m pip install              sqlite

  RUN jupyter nbextension install nbpresent --py --overwrite
  RUN jupyter nbextension enable nbpresent --py
  RUN jupyter serverextension enable nbpresent --py

  RUN mkdir -p /tmp/install
  RUN git clone https://github.com/geopandas/geopandas.git /tmp/install/geopandas
  RUN (cd /tmp/install/geopandas; pip3 install .)
  RUN rm -Rf /tmp/install
