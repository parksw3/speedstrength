## This is the speedstrength figure subdirectory

current: target
-include target.mk

# -include makestuff/perl.def

vim_session:
	bash -cl "vmt"

######################################################################

## Daniel figures
## constant_intervention.pdf HIV.pdf condom.pdf test_and_treat.pdf

Sources += $(wildcard *.R)

Ignore += condom.pdf
## condom.pdf: condom.R
%.pdf: %.Rout ;
constant_intervention.Rout HIV.Rout condom.Rout test_and_treat.Rout: %.Rout: %.R
	$(run-R)

######################################################################

newfigs: hivstrength.Rout.pdf tt.Rout.pdf gencontrol.Rout.pdf HIVexample.Rout.pdf

automatic_makeR = defined

R/%: R ;
R: dir=../
R:
	$(linkdir)

hivstrength.Rout: hivstrength.R R/data.R R/HIVfuns.R R/kernel.R

tt.Rout: tt.R R/data.R R/HIVfuns.R R/kernel.R

gencontrol.Rout: gencontrol.R R/kernel.R

HIVexample.Rout: HIVexample.R R/data.R R/HIVfuns.R R/kernel.R

coronaexample.Rout: coronaexample.R R/data.R R/corona.R R/kernel.R

######################################################################

### Makestuff

Sources += Makefile

Ignore += makestuff
Makefile: makestuff/Makefile
makestuff/Makefile:
	ln -s ../makestuff .
	ls $@

-include makestuff/os.mk

-include makestuff/makeR.mk

-include makestuff/git.mk
-include makestuff/visual.mk
-include makestuff/projdir.mk
