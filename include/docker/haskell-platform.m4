  ## Haskell
  RUN apt-get update &&  \
      apt-get install -y \
        haskell-platform 

  RUN cabal install euterpea
