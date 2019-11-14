library(tidyr)
library(dplyr)
library(ggplot2); theme_set(theme_bw())
library(gridExtra)
source("../R/data.R")
source("../R/HIVfuns.R")
source("../R/kernel.R")

h_base <- HIVgen(earlyProp = 0.23, step=0.1)
yintercept <- 4 ## arbitrary value

lfit <- lm(log(prevalence)~year, data=hiv_ts[1:8,])

g1 <- ggplot() +
	geom_hline(yintercept=yintercept, col=2) +
	scale_x_continuous("Time (years)") +
	scale_y_continuous(expression(L[condom])) +
	ggtitle("A") +
	theme(
		panel.grid = element_blank(),
		panel.border = element_blank(),
		axis.line = element_line()
	)

early <- seq(from=0.1, to=0.4, by=0.01)

R0 <- sapply(early, function(x) {
	hh <- HIVgen(earlyProp = x, step=0.1)
	r2R(hh, coef(lfit)[2]/12)
})

earlydata <- data.frame(
	early=early,
	R0=R0
)

g2 <- ggplot(earlydata) +
	geom_line(aes(early, R0, col="Epidemic")) +
	geom_hline(aes(yintercept=yintercept, col="Intervention")) +
	scale_color_manual(values=c("black", "red")) +
	scale_x_continuous("Proportion of early transmission", limits=c(0.1, 0.42), expand=c(0, 0)) +
	scale_y_continuous("Strength") +
	ggtitle("B") +
	theme(
		legend.position=c(0.85, 0.9),
		legend.title = element_blank(),
		panel.grid = element_blank(),
		panel.border = element_blank(),
		axis.line = element_line()
	)

gtot <- arrangeGrob(g1, g2, nrow=1)

ggsave("condom.pdf", gtot, width=8, height=3)
