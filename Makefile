# speedstrength
## DO YOU MEAN TO BE IN THE doc subdirectory?
## Target
current: target
-include target.mk

## Makestuff setup
Sources += Makefile 
msrepo = https://github.com/dushoff
ms = makestuff
-include $(ms)/os.mk

Ignore += $(ms)
Makefile: $(ms)/Makefile
$(ms)/Makefile:
	git clone $(msrepo)/$(ms)
	ls $@

######################################################################

Sources += cover.let submit.md reviewers.txt contribs.txt

alldirs += doc figure R code
Ignore += $(alldirs)

-include $(ms)/git.mk
-include $(ms)/visual.mk

