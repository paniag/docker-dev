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

  RUN /usr/bin/python -m pip install              csvkit            && \
      /usr/bin/python -m pip install              dbf               && \
      /usr/bin/python -m pip install              dbf               && \
      /usr/bin/python -m pip install              django            && \
      /usr/bin/python -m pip install              ecdsa             && \
      /usr/bin/python -m pip install              fiona             && \
      /usr/bin/python -m pip install              flask             && \
      /usr/bin/python -m pip install              folium            && \
      /usr/bin/python -m pip install              gdal              && \
      /usr/bin/python -m pip install              geopandas         && \
      /usr/bin/python -m pip install              gpxpy             && \
      /usr/bin/python -m pip install              graphviz          && \
      /usr/bin/python -m pip install              hyde              && \
      /usr/bin/python -m pip install              ipython           && \
      /usr/bin/python -m pip install              jupyter           && \
      /usr/bin/python -m pip install              jupyter_client    && \
      /usr/bin/python -m pip install              jupyter_console   && \
      /usr/bin/python -m pip install              jupyter_core      && \
      /usr/bin/python -m pip install              nbconvert         && \
      /usr/bin/python -m pip install              nbpresent         && \
      /usr/bin/python -m pip install              nltk              && \
      /usr/bin/python -m pip install              notebook          && \
      /usr/bin/python -m pip install              numpy             && \
      /usr/bin/python -m pip install              pandas            && \
      /usr/bin/python -m pip install              pandoc            && \
      /usr/bin/python -m pip install              pillow            && \
      /usr/bin/python -m pip install              pyproj            && \
      /usr/bin/python -m pip install              pyzmq             && \
      /usr/bin/python -m pip install              scipy             && \
      /usr/bin/python -m pip install              shapely           && \
      /usr/bin/python -m pip install              snuggs            && \
      /usr/bin/python -m pip install              sphinx            && \
      /usr/bin/python -m pip install              sympy             && \
      /usr/bin/python -m pip install              ujson             && \
      /usr/bin/python -m pip install              uuid              && \
      /usr/bin/python -m pip install              vincent

 #RUN /usr/bin/python -m pip install              basemap
 #RUN /usr/bin/python -m pip install              beautiful-soup
 #RUN /usr/bin/python -m pip install              geotiff
 #RUN /usr/bin/python -m pip install              hdf5
 #RUN /usr/bin/python -m pip install              libffi
 #RUN /usr/bin/python -m pip install              libpq
 #RUN /usr/bin/python -m pip install              mkl
 #RUN /usr/bin/python -m pip install              openblas
 #RUN /usr/bin/python -m pip install              paramiko
 #RUN /usr/bin/python -m pip install              postgresql
 #RUN /usr/bin/python -m pip install              pyaudio
 #RUN /usr/bin/python -m pip install              pyodbc
 #RUN /usr/bin/python -m pip install              pytables
 #RUN /usr/bin/python -m pip install              scrapy
 #RUN /usr/bin/python -m pip install              sqlite

  RUN jupyter nbextension install nbpresent --py --overwrite
  RUN jupyter nbextension enable nbpresent --py
  RUN jupyter serverextension enable nbpresent --py

# RUN mkdir -p /tmp/install
# RUN git clone https://github.com/geopandas/geopandas.git /tmp/install/geopandas
# RUN (cd /tmp/install/geopandas; pip3 install .)
# RUN rm -Rf /tmp/install
