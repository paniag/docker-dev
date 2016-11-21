  ## documentation tools
  RUN apt-get update &&            \
      apt-get install -y           \
        rsync                      \
        latex                      \
        pandoc                     \
        gpp                        \
        doxygen                    \
        gnuplot                    \
        graphviz                   \
        ditaa
