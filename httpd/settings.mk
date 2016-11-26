## settings.mk
## Mac Radigan

init-hook:
	cp -f ../include/init.d/httpd.sh .

clean-hook:
	-rm -f ./httpd.sh

## *EOF*
