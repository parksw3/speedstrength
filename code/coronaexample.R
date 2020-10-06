library(tidyr)
library(dplyr)
library(ggplot2); theme_set(theme_bw())
library(gridExtra)

source("makestuff/makeRfuns.R")
commandEnvironments()
## makeGraphics(width=8, height=3)
makeGraphics()

g_pre <- gen(sat=0)
g_post <- gen(sat=10)

print(intervalMoments(g_pre))
print(intervalMoments(g_post))

print(
	ggplot(g_pre) +
	geom_line(aes(time, density)) +
	scale_x_continuous("Generation time (days)") +
	scale_y_continuous("Density (per day)", expand=c(0, 0)) +
	theme(
		legend.position=c(0.9, 0.9),
		legend.title=element_blank(),
		panel.grid = element_blank(),
		panel.border = element_blank(),
		axis.line = element_line()
	) +
	geom_line(aes(time, density), data=g_post) +
	NULL
)

