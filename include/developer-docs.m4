  ## documentation tools
  RUN apt-get update &&            \
      apt-get install -y           \
        rsync                      \
        evince                     \
        texlive-latex-extra        \
        texlive-science            \
        texlive-full               \
        python-pygments            \
        pandoc                     \
        gpp                        \
        doxygen                    \
        gnuplot                    \
        graphviz                   \
        ditaa
