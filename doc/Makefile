
current: target
-include target.mk

##################################################################

## Defs

Sources += Makefile

ms = makestuff
Ignore += $(ms)
Makefile: $(ms)/Makefile
	touch $@
$(ms)/Makefile:
	ls ../makestuff/Makefile && /bin/ln -s ../makestuff 

-include $(ms)/perl.def
-include $(ms)/os.mk

######################################################################

Sources += *.tex

## speedstrength.pdf: speedstrength.tex

Sources += notes.md

######################################################################

## Abstract text

abstract.txt: speedstrength.tex abstract.pl
	$(PUSH)

######################################################################

### Makestuff

-include $(ms)/git.mk
-include $(ms)/visual.mk
-include $(ms)/texdeps.mk

