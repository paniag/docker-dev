#!/usr/bin/make
## container.mk
## Mac Radigan

.PHONY: build clean
.DEFAULT_GOAL := all

all: build

build:
	./ctl --install

clean:
	./ctl --destroy-all

## *EOF*
