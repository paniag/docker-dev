  ## basic tools
  RUN apt-get update &&  \
      apt-get install -y \
        zsh              \
        vim              \
        vim-gnome        \
        screen           \
        wget             \
        curl             \
        rsync            \
        netcat           \
        xclip            \
        build-essential  \
        git               
