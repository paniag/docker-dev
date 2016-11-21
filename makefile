#!/usr/bin/make
## makefile (for docker-dev)
## Mac Radigan

.PHONY: submodules build clean
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

## *EOF*
