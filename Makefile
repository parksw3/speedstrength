# speedstrength
## DO YOU MEAN TO BE IN THE docs subdirectory?
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

alldirs += doc figure R

# figure/figure1.pdf three-panel R v ρ for HIV
# figure/figure2.pdf Strength-like condoms
# figure/figure3.pdf Two perspectives on HIV intervention
### Makestuff rules

-include $(ms)/git.mk
-include $(ms)/visual.mk

