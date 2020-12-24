# speedstrength development
# All of the public-facing stuff moved to
## https://github.com/mac-theobio/Speed_and_strength

current: target
-include target.mk

######################################################################

Sources += cover.let contribs.txt

alldirs += code
Ignore += $(alldirs)

-include makestuff/perl.def

######################################################################

Sources += $(wildcard *.tex)
Sources += $(wildcard *.css)

## Include: significance.tex ## Drafted for PNAS

## speedstrength.pdf: speedstrength.tex
## response.pdf: response.tex

Ignore += speedstrength.ld.out speedstrength.ld.pdf
## speedstrength.ld.pdf: speedstrength.tex

Sources += press.txt ## 100-word something for prsb
Ignore += fullresponse.pdf
## combined rtr document for prsb
fullresponse.pdf: response.pdf speedstrength.ld.pdf
	$(pdfcat)

## supp.pdf: supp.tex

## speedstrength.tex.texcount: speedstrength.tex
## Sources += speedstrength.bib
## speedstrength.bbl: speedstrength.bib

######################################################################

## Clean up heading text for submission

## Sources += reviewers.txt ## Moved to ../

## Sources += abstract.pl
Ignore += head.txt
head.txt: speedstrength.tex abstract.pl
	$(PUSH)

Sources += $(wildcard *.md)

######################################################################

## resources/dhm_chapter.pdf
resources: dir=~/Dropbox/archive/speedstrength
resources:
	$(linkdirname)
resources/%:
	$(MAKE) resources

######################################################################

## Responses (older ones archived; see log)
## responses.pdf: responses.tex;  $(pandoc)
## prsb_responses.tex: prsb_responses.html; $(pandoc)
Ignore += prsb_responses.html
prsb_responses.html: prsb_responses.md response.css; pandoc --to html4 --from markdown+autolink_bare_uris+ascii_identifiers+tex_math_single_backslash+smart -s -c response.css -o $@ $<

## Automake

hotdirs += code

######################################################################

### Makestuff

## Makestuff setup
Sources += Makefile 
msrepo = https://github.com/dushoff
ms = makestuff

Ignore += makestuff
Makefile: makestuff/Makefile
makestuff/Makefile:
	git clone $(msrepo)/makestuff
	ls $@

-include makestuff/os.mk

-include makestuff/texdeps.mk
-include makestuff/utils.mk
-include makestuff/pandoc.mk
-include makestuff/hotcold.mk

-include makestuff/git.mk
-include makestuff/visual.mk
