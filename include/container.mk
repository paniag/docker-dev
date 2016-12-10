#!/usr/bin/make -sf
## container.mk
## Mac Radigan

.PHONY: help acls build clean run start stop connect generate init-hook clean-hook

absroot = $(shell pwd)

init-hook:
	@echo "OVERRIDE ME" >/dev/null
clean-hook:
	@echo "OVERRIDE ME" >/dev/null
post-build-hook:
	@echo "OVERRIDE ME" >/dev/null

include instance.cfg
-include settings.mk

ifdef ssh-port
  opt-ssh-port = -p $(ssh-port):22 
endif
ifdef nodejs-port
  opt-nodejs-port = -p $(nodejs-port):8081
endif
ifdef vnc-port
  opt-vnc-port = -p $(vnc-port):5901 
endif
ifdef vncx0-port
  opt-vncx0-port = -p $(vncx0-port):5900
endif
ifdef httpd-port
  opt-httpd-port = -p $(httpd-port):80
endif
ifdef influx-web-port
  opt-influx-web-port = -p $(influx-web-port):8083
endif
ifdef influx-port
  opt-influx-port = -p $(influx-port):8086
endif
ifdef jupyter-port
  opt-jupyter-port = -p $(jupyter-port):8888
endif
ifdef jupyterhub-port
  opt-jupyterhub-port = -p $(jupyterhub-port):8000
endif
ifdef data
  opt-data = -v $(data):/data
endif
ifdef srv
  opt-srv = -v $(srv):/srv 
endif
ifdef mount1-local
  opt-mount1 = -v $(mount1-host):$(mount1-local)
endif
ifdef mount2-local
  opt-mount2 = -v $(mount2-host):$(mount2-local)
endif
ifdef mount3-local
  opt-mount3 = -v $(mount3-host):$(mount3-local)
endif
ifdef mount4-local
  opt-mount4 = -v $(mount4-host):$(mount4-local)
endif
ifdef mount5-local
  opt-mount5 = -v $(mount5-host):$(mount5-local)
endif
ifdef mount6-local
  opt-mount6 = -v $(mount6-host):$(mount6-local)
endif
run-opts = $(opt-mount1) $(opt-mount2) $(opt-mount3) $(opt-mount4) $(opt-mount5) $(opt-mount6) $(opt-ssh-port) $(opt-nodejs-port) $(opt-vncx0-port) $(opt-vnc-port) $(opt-httpd-port) $(influx-port) $(influx-web-port) $(opt-jupyter-port) $(opt-jupyterhub-port) $(opt-data) $(opt-srv)

build: init-hook generate acls
	docker build -t $(name) .
	cat ../security/phusion-001.pub >> $(absroot)/../users/root/.ssh/authorized_keys
	cat ../security/phusion-001.pub >> $(absroot)/../users/home/dev/.ssh/authorized_keys
	touch $(absroot)/../users/home/dev/.Xauthority
	$(MAKE) post-build-hook

acls: ../security/phusion-001
	@echo "PHONY " >/dev/null

../security/phusion-001:
	-mkdir -p ../security
	ssh-keygen -t rsa -b 2048 -f $@ -q -N ""

connect:
	ssh -A -X -i $(absroot)/../security/phusion-001 -p $(ssh-port) dev@localhost

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
           $(run-opts) \
           -e DISPLAY=${DISPLAY} \
           -t \
           -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
           -v $(absroot)/../users/root:/root \
           $(name)

stop:                                                
	docker ps -a --no-trunc | grep $(name) | awk '{print$$1}' | xargs -I{} docker stop {}

flatten:
	$(MAKE) start
	docker ps -a --no-trunc | grep $(name) | awk '{print$$1}' | xargs -I{} docker export {} | docker import - $(name):flat
	$(MAKE) stop

export:
	docker ps -a --no-trunc | grep $(name) | awk '{print$$1}' | xargs -I{} docker export {} >$(subst /,_,$(name)).img

save:
	docker ps -a --no-trunc | grep $(name) | awk '{print$$1}' | xargs -I{} docker save {} >$(subst /,_,$(name)).img-flat

clean: clean-hook
	-rm -f ./Dockerfile
	docker ps -a --no-trunc | grep $(name) | awk '{print$$1}' | xargs -I{} docker stop {}
	docker images -a --no-trunc | grep $(name) | awk '{print$$3}' | xargs -I{} docker rmi -f {}

clobber:
	-rm -f ./Dockerfile
	docker ps -a --no-trunc | grep $(name) | awk '{print$$1}' | xargs -I{} docker stop {}
	docker images -a --no-trunc | grep $(name) | awk '{print$$3}' | xargs -I{} docker rmi -f {}
	-rm -f ../security/phusion-001
	-rm -f ../security/phusion-001.pub

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
