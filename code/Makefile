
## This is the speedstrength code subdirectory

current: target
-include target.mk

# -include makestuff/perl.def

vim_session:
	bash -cl "vmt"

######################################################################

Sources += $(wildcard *.R)
automatic_makeR = defined

######################################################################

## Paper figures

Ignore += newfigs.pdf
newfigs.pdf: gencontrol.Rout.pdf HIVexample.Rout.pdf condom.Rout.pdf tt.Rout.pdf
	$(pdfcat)

gencontrol.Rout: gencontrol.R kernel.R

HIVfit.Rout: HIVfit.R data.rda

HIVexample.Rout: HIVexample.R data.rda HIVfuns.rda kernel.rda

condom.Rout: condom.R data.R HIVfuns.R kernel.R

tt.Rout: tt.R data.R HIVfuns.R kernel.R

coronaexample.Rout: coronaexample.R coronafuns.rda kernel.rda

## R scripts that don't use makeR yet.
legacy = coronafuns kernel data HIVfuns
legacytargets = $(legacy:%=%.Rout)
$(legacytargets): %.Rout: %.R
	$(run-R)

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
