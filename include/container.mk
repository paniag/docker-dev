#!/usr/bin/make
## container.mk
## Mac Radigan

.PHONY: help build clean run start stop connect generate
.DEFAULT_GOAL := all

include instance.cfg

absroot = $(shell pwd)

all: build

build: generate
	ssh-keygen -t rsa -b 2048 -f ./phusion-001 -q -N ""
	docker build -t $(name) .
	cat ./phusion-001.pub >> $(absroot)/../users/root/.ssh/authorized_keys
	cat ./phusion-001.pub >> $(absroot)/../users/home/dev/.ssh/authorized_keys
	touch $(absroot)/../users/home/dev/.Xauthority

connect:
	ssh -A -X -i $(absroot)/phusion-001 -p $(port) dev@localhost

start:
	docker run \
           -p $(port):22 \
           -e DISPLAY=${DISPLAY} \
           -u dev \
           -t \
           -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
           -v /data:$(mount) \
           -v $(absroot)/../users/root:/root \
           -v $(absroot)/../users/home:/home \
           $(name) 1>/dev/null 2>/dev/null &

run:
	docker run \
           -p $(port):22 \
           -e DISPLAY=${DISPLAY} \
           -u dev \
           -t \
           -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
           -v /data:$(mount) \
           -v $(absroot)/../users/root:/root \
           -v $(absroot)/../users/home:/home \
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
	m4 -I../include Dockerfile.m4 >Dockerfile

## *EOF*
