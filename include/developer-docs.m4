  ## documentation tools
  RUN apt-get update &&            \
      apt-get install -y           \
        rsync                      \
        evince                     \
        latex                      \
        pandoc                     \
        gpp                        \
        doxygen                    \
        gnuplot                    \
        graphviz                   \
        ditaa
