#!/bin/bash
## ctl
## Mac Radigan

  d=${0%/*}; f=${0##*/}; n=${f%.*}; e=${f##*.}

  root=$d

  S__SUCCESS=0
  S__NO_SUCH_COMMAND=1

  usage()
  {
    cat <<-EOT 
		$f [-c]
EOT
    exit 1
  }

  die()
  {
    code=$1; shift
    msg=$1;  shift
    echo "ERROR ${code}: ${msg}"
    exit $code
  }

  if [[ "$#" == "0" ]]; then
    usage
  fi

  cfg=${root}/instance.cfg
  if [ -f $cfg ]; 
  then
   . $cfg
  else
    die ${S__NO_SUCH_COMMAND} "missing configuration file: $cfg" 
  fi

  port=${DOCKER__port}
  name=${DOCKER__name}
  mount=${DOCKER__mount}

  arg=$1; shift
  while [[ $arg == -* ]]; do
    case $arg in
      -c|--connect)
        cmd="ssh -A -X -i ${root}/phusion-001 -p ${port} dev@localhost"
       #echo $cmd
        eval $cmd
        ;;
      -i|--install)
        (cd ${root}; ssh-keygen -t rsa -b 2048 -f ./phusion-001 -q -N "")
        (cd ${root}; docker build -t ${name} .)
        ;;
      -s|--start)
        (cd ${root}; \
         docker run \
           -p ${port}:22 \
           -e DISPLAY=$DISPLAY \
           -u dev \
           -t \
           -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
           -v /data:${mount} \
           ${name} 1>/dev/null 2>/dev/null &)
        ;;
      -S|--stop)
        (cd ${root}; docker stop ${name})
        ;;
      -x|--id)
        id=`docker ps|awk "/${name}/{print\$1}"`
        echo $id
        ;;
      -p|--ps)
        >&2 docker ps|awk "/${name}/{print\$1}" 
        ;;
      --destroy)
        id=`docker ps|awk "/${name}/{print\$1}"`
        docker rmi -f $id
        ;;
      --destroy-all)
        docker ps     | awk "/${name}/{print\$1}" | xargs -I{} docker stop {}
        docker images | awk "/${name}/{print\$3}" | xargs -I{} docker rmi -f {}
        ;;
      *)
        die $S__NO_SUCH_COMMAND "invalid command: $arg"
        ;;
    esac
    arg=$1; shift
  done

  exit $S__SUCCESS


## *EOF*
