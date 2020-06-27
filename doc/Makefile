
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

Sources += $(wildcard *.tex)

## Include: significance.tex ## Drafted for PNAS
## speedstrength.pdf: speedstrength.tex
## speedstrength.tex.texcount: speedstrength.tex

######################################################################

## Clean up heading text for submission

Sources += reviewers.txt

Sources += abstract.pl
Ignore += head.txt
head.txt: speedstrength.tex abstract.pl
	$(PUSH)

######################################################################

### Makestuff

-include $(ms)/git.mk
-include $(ms)/visual.mk
-include $(ms)/texdeps.mk
-include $(ms)/utils.mk

