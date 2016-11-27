#!/bin/bash
## jupyter.sh
## Mac Radigan

# (cd /srv/jupyter/data; jupyter notebook      \
#   --ip=0.0.0.0                               \
#   --no-browser                               \
#   --config=/srv/jupyter/conf/jupyter.conf    \
#   &                                          \
# )

  (cd /srv/jupyter/data; jupyterhub            \
    --no-ssl                                   \
    --ip=0.0.0.0                               \
    --config=/srv/jupyter/conf/jupyter.conf    \
    &                                          \
  )

## *EOF*
