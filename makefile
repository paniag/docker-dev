#!/usr/bin/make
## makefile (for docker-dev)
## Mac Radigan

.PHONY: submodules build clean clobber
.DEFAULT_GOAL := all

all: build

submodules:
	$(MAKE) -C $@

build:
	$(MAKE) -C docker-dev-av
	$(MAKE) -C docker-dev-basic
	$(MAKE) -C docker-dev-full
	$(MAKE) -C google-earth

clean:
	$(MAKE) -C docker-dev-av    clean
	$(MAKE) -C docker-dev-basic clean
	$(MAKE) -C docker-dev-full  clean
	$(MAKE) -C google-earth     clean

clobber: clean
	docker ps     -a --no-trunc | tail -n +1 | awk '{print $$1}' | xargs -I{} docker stop {}
	docker images -a --no-trunc | tail -n +1 | awk '{print $$3}' | xargs -I{} docker rmi -f {}

## *EOF*
