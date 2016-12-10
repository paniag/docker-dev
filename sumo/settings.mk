## settings.mk
## Mac Radigan

submodules:
	$(MAKE) ./submodules

play-lust:
	$(MAKE) ARGS="--fcd-output.geo --fcd-output /data/LuST-dua-static.fcd-geo -c /data/LuSTScenario/scenario/dua.static.sumocfg"

## *EOF*
