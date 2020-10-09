library(tidyr)
library(dplyr)
library(ggplot2); theme_set(theme_bw())
library(gridExtra)

source("makestuff/makeRfuns.R")
commandEnvironments()
makeGraphics(width=8, height=3)

base = HIVgen(earlyProp = earlyBase)
fast = HIVgen(earlyProp = earlyFast)
slow = HIVgen(earlyProp = earlySlow)

gens <- (
	list(
		base = base
		, fast = fast
		, slow = slow
	)
	%>% bind_rows(.id = "type")
)

g1 <- (ggplot(gens)
	+ geom_line(aes(time*month/year, density*year/month, color=type))
	+ scale_x_continuous("Generation time (years)")
	+ scale_y_continuous("Density (per year)", expand=c(0, 0))
	+ ggtitle("A")
	+ theme(
		legend.position=c(0.9, 0.9),
		legend.title=element_blank(),
		panel.grid = element_blank(),
		panel.border = element_blank(),
		axis.line = element_line()
	)
)
grid.arrange(g1, g1, nrow=1)
