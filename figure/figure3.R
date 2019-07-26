library(tidyr)
library(dplyr)
library(ggplot2); theme_set(theme_bw())
library(gridExtra)
source("../R/data.R")
source("../R/HIVfuns.R")
source("../R/kernel.R")

maxRate <- 1/6
h_base <- HIVgen(earlyProp = 0.23, step=0.1)

lfit <- lm(log(prevalence)~year, data=hiv_ts[1:8,])

b_base <- b0fun(h_base, coef(lfit)[2]/12)

tt <- testingFun(maxRate)

g1 <- ggplot(tt) +
	geom_line(aes(time/12, strength), col=2) +
	geom_hline(yintercept=theFun(h_base, tt), lty=2, col=2) +
	scale_x_continuous("Time (years)") +
	scale_y_continuous(expression(L[test])) +
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

interstrength <- sapply(early, function(x) {
	hh <- HIVgen(earlyProp = x, step=0.1)
	theFun(hh, tt)
})

strengthdata <- data.frame(
	early=early,
	strength=interstrength
)

g2 <- ggplot(earlydata) +
	geom_line(aes(early, R0, col="Epidemic")) +
	geom_line(data=strengthdata, aes(early, strength, col="Intervention")) +
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

g3 <- ggplot(tt) +
	geom_line(aes(time/12, hazRate), col=2) +
	geom_hline(aes(yintercept=phiFun(b_base, tt)), lty=2, col=2) +
	scale_x_continuous("Time (years)") +
	scale_y_continuous(expression(h[test])) +
	ggtitle("C") +
	theme(
		panel.grid = element_blank(),
		panel.border = element_blank(),
		axis.line = element_line()
	)

interspeed <- sapply(early, function(x) {
	hh <- HIVgen(earlyProp = x, step=0.1)
	bb <- b0fun(hh, coef(lfit)[2]/12)
	
	phiFun(bb, tt)
})

speeddata <- data.frame(
	early=early,
	speed=interspeed*12
)

g4 <- ggplot(speeddata) +
	geom_line(aes(early, speed, col="Intervention")) +
	geom_hline(aes(yintercept=coef(lfit)[[2]], col="Epidemic" )) +
	scale_x_continuous("Proportion of early transmission", limits=c(0.1, 0.42), expand=c(0, 0)) +
	scale_y_continuous(expression(Speed~(year^{-1})) , limits=c(0.3, 0.8)) +
	scale_color_manual(values=c("black", "red")) +
	ggtitle("D") +
	theme(
		legend.position = "none",
		panel.grid = element_blank(),
		panel.border = element_blank(),
		axis.line = element_line()
	)

gtot <- arrangeGrob(g1, g2, g3, g4, nrow=2)

ggsave("figure3.pdf", gtot, width=8, height=6)
