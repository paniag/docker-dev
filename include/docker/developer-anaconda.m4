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
        python3-pip           \
        python-pip

  RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh && \
      wget --quiet https://repo.continuum.io/archive/Anaconda2-4.2.0-Linux-x86_64.sh -O ~/anaconda.sh && \
      /bin/bash ~/anaconda.sh -b -p /opt/conda && \
      rm ~/anaconda.sh

  ## update and install packages

  ## conda
  RUN conda update conda
  RUN conda install -y -c ioos            folium
  RUN conda install -y -c ioos            vincent
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
  RUN conda install -y -c anaconda        sympy
  RUN conda install -y -c anaconda        scipy
  RUN conda install -y -c anaconda        scrapy
  RUN conda install -y -c anaconda        numpy
  RUN conda install -y -c unidata         shapely
  RUN conda install -y -c anaconda        snuggs
  RUN conda install -y -c blaze           sqlite
  RUN conda install -y -c dhirschfeld     sphinx
  RUN conda install -y -c anaconda        ujson
  RUN conda install -y -c anaconda        nltk
  RUN conda install -y -c trentonoliphant uuid
  RUN conda install -y -c trentonoliphant nbpresent
  RUN conda install -y -c trentonoliphant nbconvert
  RUN conda install -y -c trentonoliphant notebook

# RUN conda install -y python=3
  RUN conda create  -y --name py   python
  RUN conda create  -y --name py3  python=3
  RUN conda create  -y --name py35 python=3.5
# RUN source activate py35
# RUN ipython kernelspec install-self
  RUN python2 -m pip install ipykernel
  RUN python2 -m ipykernel install --user
  RUN python3 -m pip install ipykernel
  RUN python3 -m ipykernel install --user

  ## pip
  RUN python3 -m pip install              folium
  RUN python3 -m pip install              vincent
  RUN python3 -m pip install              gpxpy
  RUN python3 -m pip install              basemap
  RUN python3 -m pip install              beautiful-soup
  RUN python3 -m pip install              csvkit
  RUN python3 -m pip install              dbf
  RUN python3 -m pip install              dbf
  RUN python3 -m pip install              django
  RUN python3 -m pip install              ecdsa
  RUN python3 -m pip install              fiona
  RUN python3 -m pip install              pillow
  RUN python3 -m pip install              flask
  RUN python3 -m pip install              pandoc
  RUN python3 -m pip install              gdal
  RUN python3 -m pip install              geotiff
  RUN python3 -m pip install              graphviz
  RUN python3 -m pip install              hyde
  RUN python3 -m pip install              hdf5
  RUN python3 -m pip install              ipython
  RUN python3 -m pip install              jupyter
  RUN python3 -m pip install              jupyter_console
  RUN python3 -m pip install              jupyter_client
  RUN python3 -m pip install              jupyter_core
  RUN python3 -m pip install              libffi
  RUN python3 -m pip install              libpq
  RUN python3 -m pip install              pandas
  RUN python3 -m pip install              mkl
  RUN python3 -m pip install              openblas
  RUN python3 -m pip install              paramiko
  RUN python3 -m pip install              postgresql
 #RUN python3 -m pip install              pyaudio
  RUN python3 -m pip install              pyodbc
  RUN python3 -m pip install              geopandas
  RUN python3 -m pip install              pyproj
  RUN python3 -m pip install              pytables
  RUN python3 -m pip install              pyzmq
  RUN python3 -m pip install              sympy
  RUN python3 -m pip install              scipy
  RUN python3 -m pip install              scrapy
  RUN python3 -m pip install              numpy
  RUN python3 -m pip install              shapely
  RUN python3 -m pip install              snuggs
  RUN python3 -m pip install              sqlite
  RUN python3 -m pip install              sphinx
  RUN python3 -m pip install              ujson
  RUN python3 -m pip install              nltk
  RUN python3 -m pip install              uuid
  RUN python3 -m pip install              nbpresent
  RUN python3 -m pip install              nbconvert
  RUN python3 -m pip install              notebook

  RUN jupyter nbextension install nbpresent --py --overwrite
  RUN jupyter nbextension enable nbpresent --py
  RUN jupyter serverextension enable nbpresent --py
