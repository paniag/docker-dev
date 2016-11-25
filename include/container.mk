#!/usr/bin/make -sf
## container.mk
## Mac Radigan

.PHONY: help build clean run start stop connect generate

absroot = $(shell pwd)

include instance.cfg

ifdef ssh-port
  opt-ssh-port = -p $(ssh-port):22 
endif
ifdef vnc-port
  opt-vnc-port = -p $(vnc-port):5901 
endif
ifdef vncx0-port
  opt-vncx0-port = -p $(vncx0-port):5900
endif
ifdef jupyter-port
  opt-jupyter-port = -p $(jupyter-port):8888
endif
ifdef mount
  opt-mount = -v $(mount):/dat 
endif
run-opts = $(opt-ssh-port) $(opt-vncx0-port) $(opt-vnc-port) $(opt-jupyter-port) $(opt-mount)

build: generate
	ssh-keygen -t rsa -b 2048 -f ./phusion-001 -q -N ""
	docker build -t $(name) .
	cat ./phusion-001.pub >> $(absroot)/../users/root/.ssh/authorized_keys
	cat ./phusion-001.pub >> $(absroot)/../users/home/dev/.ssh/authorized_keys
	touch $(absroot)/../users/home/dev/.Xauthority

connect:
	ssh -A -X -i $(absroot)/phusion-001 -p $(ssh-port) dev@localhost

start:
	docker run \
           $(run-opts) \
           -e DISPLAY=${DISPLAY} \
           -u dev \
           -t \
           -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
           -v $(absroot)/../users/root:/root \
           -v $(absroot)/../users/home:/home \
           $(name) 1>/dev/null 2>/dev/null &

run:
	docker run -i \
           -e DISPLAY=${DISPLAY} \
           -t \
           -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
           -v $(absroot)/../users/root:/root \
           $(name)

stop:                                                
	docker ps -a --no-trunc | grep $(name) | awk '{print$$1}' | xargs -I{} docker stop {}

clean:
	-rm -f ./Dockerfile
	docker ps -a --no-trunc | grep $(name) | awk '{print$$1}' | xargs -I{} docker stop {}
	docker images -a --no-trunc | grep $(name) | awk '{print$$3}' | xargs -I{} docker rmi -f {}
	-rm -f ./phusion-001
	-rm -f ./phusion-001.pub

generate: Dockerfile
Dockerfile:
	m4 -I../include/docker Dockerfile.m4 >Dockerfile

help:
	@>&2 echo ""
	@>&2 echo "docker-dev help:"
	@>&2 echo ""
	@>&2 echo "  usage:  make -f <container_directory> <command>"
	@>&2 echo ""
	@>&2 echo "  COMMANDS:"
	@>&2 echo ""
	@>&2 echo "    connect   - establishes an SSH connection"
	@>&2 echo "    run       - runs the container entry point"
	@>&2 echo "    start     - starts the continer with init system"
	@>&2 echo "    stop      - stops the container"
	@>&2 echo "    build     - builds the container"
	@>&2 echo "    generate  - generates a Dockerfile"
	@>&2 echo ""

## *EOF*
