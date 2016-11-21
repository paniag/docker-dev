  ## basic tools
  RUN apt-get install -y zsh
  RUN apt-get install -y vim
  RUN apt-get install -y vim-gnome
  RUN apt-get install -y screen
  RUN apt-get install -y wget
  RUN apt-get install -y curl
  RUN apt-get install -y build-essential

  ## CM tools
  RUN apt-get install -y git 
