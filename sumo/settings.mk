## settings.mk
## Mac Radigan

submodules:
	$(MAKE) ./submodules

play-lust:
	$(MAKE) ARGS="netconvert -s /data/LuSTScenario/scenario/lust.net.xml --simple-projection --output-prefix"
	$(MAKE) ARGS="sumo --fcd-output.geo --fcd-output /data/LuST-dua-static.fcd-geo -c /data/LuSTScenario/scenario/dua.static.sumocfg"


## *EOF*
