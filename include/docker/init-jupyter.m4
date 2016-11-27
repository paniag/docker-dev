  ## Jupyter init hook

  RUN mkdir -p /etc/my_init.d

  
  RUN apt-get update &&  \
      apt-get install -y \
        npm              \
        nodejs-legacy

  RUN npm install -g configurable-http-proxy
  RUN python3 -m pip install jupyterhub

  ADD jupyter.sh /etc/my_init.d/jupyter.sh
