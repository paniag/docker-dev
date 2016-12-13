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
	$(MAKE) -C docker-dev-python $@
	$(MAKE) -C httpd             $@
	$(MAKE) -C postgis           $@
	#$(MAKE) -C docker-dev-av     $@
	#$(MAKE) -C docker-dev-basic  $@
	#$(MAKE) -C docker-dev-full   $@
	#$(MAKE) -C google-earth      $@
	#$(MAKE) -C influxdb          $@
	#$(MAKE) -C haskell           $@
	#$(MAKE) -C jsoftware         $@
	#$(MAKE) -C mutt              $@
	#$(MAKE) -C neovim            $@
	#$(MAKE) -C sbcl              $@

clean:
	$(MAKE) -C docker-dev-python $@
	$(MAKE) -C httpd             $@
	$(MAKE) -C postgis           $@
	#$(MAKE) -C docker-dev-av     $@
	#$(MAKE) -C docker-dev-basic  $@
	#$(MAKE) -C docker-dev-full   $@
	#$(MAKE) -C google-earth      $@
	#$(MAKE) -C influxdb          $@
	#$(MAKE) -C haskell           $@
	#$(MAKE) -C jsoftware         $@
	#$(MAKE) -C mutt              $@
	#$(MAKE) -C neovim            $@
	#$(MAKE) -C sbcl              $@

clobber: clean
	docker ps     -a --no-trunc | tail -n +1 | awk '{print $$1}' | xargs -I{} docker stop {}
	docker images -a --no-trunc | tail -n +1 | awk '{print $$3}' | xargs -I{} docker rmi -f {}
	-rm -f ./security/phusion-001
	-rm -f ./security/phusion-001.pub

## *EOF*
