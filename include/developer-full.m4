  ## more basic tools
  RUN apt-get install -y xterm
  RUN apt-get install -y wget
  RUN apt-get install -y curl
  RUN apt-get install -y vim
  RUN apt-get install -y vim-gnome
  RUN apt-get install -y zsh
  RUN apt-get install -y rlwrap
  RUN apt-get install -y screen
  RUN apt-get install -y tmux
  RUN apt-get install -y xclip 
  RUN apt-get install -y rxvt-unicode 
  RUN apt-get install -y build-essential

  ## CM tools
  RUN apt-get install -y git 
  RUN apt-get install -y mercurial
  RUN apt-get install -y subversion

  ## analysis basic
  RUN apt-get install -y ack-grep 
  RUN apt-get install -y gnuplot 
  RUN apt-get install -y graphviz 

  ## developer basic
  RUN apt-get install -y guile-2.0 
  RUN apt-get install -y guile-2.0-dev 
  RUN apt-get install -y sbcl 
  RUN apt-get install -y haskell-platform 
  RUN apt-get install -y pandoc 
  RUN apt-get install -y gpp 
  RUN apt-get install -y ditaa 
