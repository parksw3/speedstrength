## This is the speedstrength R subdirectory

current: target
-include target.mk

# -include makestuff/perl.def

vim_session:
	bash -cl "vmt"

######################################################################

kernel.Rout: kernel.R

######################################################################

### Makestuff

Sources += Makefile

Ignore += makestuff
Makefile: makestuff/Makefile
makestuff/Makefile:
	ln -s ../makestuff .
	ls $@

-include makestuff/os.mk

-include makestuff/wrapR.mk

-include makestuff/git.mk
-include makestuff/visual.mk
-include makestuff/projdir.mk
