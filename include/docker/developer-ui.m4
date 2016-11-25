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
        locate           \
        git              \
        x11vnc           \
        vnc4server       \
        i3               \
        twm              \
        fvwm

