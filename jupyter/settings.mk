## settings.mk
## Mac Radigan

init-hook:
	cp -f ../include/init.d/jupyter.sh .

clean-hook:
	-rm -f ./jupyter.sh

## *EOF*
