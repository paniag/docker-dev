  ## Haskell
  RUN apt-get update &&  \
      apt-get install -y \
        libasound-dev    \
        libportmidi-dev  \
        haskell-platform 

  RUN cabal update
  RUN cabal install euterpea
