#!/bin/bash
## jupyter.sh
## Mac Radigan

  (cd /srv/jupyter; jupyter notebook \
    --ip=0.0.0.0                     \
    --no-browser                     \
    &                                \
  )

## *EOF*
