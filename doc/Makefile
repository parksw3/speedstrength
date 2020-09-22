
current: target
-include target.mk

##################################################################

## Defs

Sources += Makefile

ms = makestuff
Ignore += makestuff
Makefile: makestuff/Makefile
	touch $@
makestuff/Makefile:
	ls ../makestuff/Makefile && /bin/ln -s ../makestuff 

-include makestuff/perl.def
-include makestuff/os.mk

######################################################################

Sources += $(wildcard *.tex)

## Include: significance.tex ## Drafted for PNAS
## speedstrength.pdf: speedstrength.tex
## speedstrength.tex.texcount: speedstrength.tex
Sources += speedstrength.bib
speedstrength.bbl: speedstrength.bib

######################################################################

## Clean up heading text for submission

## Sources += reviewers.txt ## Moved to ../

Sources += abstract.pl
Ignore += head.txt
head.txt: speedstrength.tex abstract.pl
	$(PUSH)

Sources += $(wildcard *.md)

Ignore += prsb_responses.gh.html
prsb_responses.gh.html: prsb_responses.md
prsb_responses.html: prsb_responses.md

prsb_instructions.md:
prsb_reviews.md:

## resources/dhm_chapter.pdf
resources: dir=~/Dropbox/archive/speedstrength
resources:
	$(linkdirname)
resources/%:
	$(MAKE) resources

######################################################################

### Makestuff

-include makestuff/git.mk
-include makestuff/visual.mk
-include makestuff/texdeps.mk
-include makestuff/utils.mk
-include makestuff/pandoc.mk

