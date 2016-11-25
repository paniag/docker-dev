#!/usr/bin/make -sf
## makefile (for docker-dev)
## Mac Radigan

.PHONY: submodules build clean clobber help
.DEFAULT_GOAL := help

help:
	$(MAKE) -C docker-dev-basic  help

submodules:
	$(MAKE) -C $@

build:
	$(MAKE) -C docker-dev-av     build
	$(MAKE) -C docker-dev-basic  build
	$(MAKE) -C docker-dev-full   build
	$(MAKE) -C google-earth      build

clean:
	$(MAKE) -C docker-dev-av     clean
	$(MAKE) -C docker-dev-basic  clean
	$(MAKE) -C docker-dev-full   clean
	$(MAKE) -C google-earth      clean

clobber: clean
	docker ps     -a --no-trunc | tail -n +1 | awk '{print $$1}' | xargs -I{} docker stop {}
	docker images -a --no-trunc | tail -n +1 | awk '{print $$3}' | xargs -I{} docker rmi -f {}

## *EOF*
