  ## more basic tools
  RUN apt-get update &&  \
      apt-get install -y \
        xterm            \
        wget             \
        curl             \
        vim              \
        vim-gnome        \
        zsh              \
        rlwrap           \
        screen           \
        tmux             \
        xclip            \
        rxvt-unicode     \
        build-essential

  ## CM tools
  RUN apt-get update &&  \
      apt-get install -y \
        git              \
        mercurial        \
        subversion

  ## analysis basic
  RUN apt-get update &&  \
      apt-get install -y \
        ack-grep         \
        gnuplot          \
        graphviz 

  ## developer basic
  RUN apt-get update &&  \
      apt-get install -y \
        guile-2.0        \
        guile-2.0-dev    \
        sbcl             \
        haskell-platform \
        pandoc           \
        gpp              \
        ditaa 
