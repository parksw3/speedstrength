library(tidyr)
library(dplyr)
library(ggplot2); theme_set(theme_bw())
library(gridExtra)

source("makestuff/makeRfuns.R")
sourceFiles()
makeGraphics(width=8, height=6)

maxRate <- 1/6
h_base <- HIVgen(earlyProp = 0.23, step=0.1)

lfit <- lm(log(prevalence)~year, data=hiv_ts[1:8,])

b_base <- b0fun(h_base, coef(lfit)[2]/12)

tt <- testingFun(maxRate)

g1 <- ggplot(tt) +
	geom_line(aes(time/12, strength), col=2) +
	geom_hline(yintercept=theFun(h_base, tt), lty=2, col=2) +
	scale_x_continuous("Time (years)", expand=c(0,0), limits=c(0, 16.5)) +
	scale_y_log10(expression(L[test])) +
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
  geom_point(data=earlydata[earlydata$early==0.23,], aes(early, R0), size=5) +
  geom_point(data=strengthdata[strengthdata$early==0.23,], aes(early, strength), size=5, col="red") +
	scale_x_continuous("Proportion of early transmission", limits=c(0.1, 0.42), expand=c(0, 0)) +
	scale_y_log10("Strength", limits=c(1, 16), expand=c(0, 0), breaks=c(1, 2, 4, 8, 16)) +
	ggtitle("B") +
	theme(
		legend.position=c(0.85, 0.9),
		legend.title = element_blank(),
		panel.grid = element_blank(),
		panel.border = element_blank(),
		axis.line = element_line()
	)

g3 <- ggplot(tt) +
	geom_line(aes(time/12, hazRate*12), col=2) +
	geom_hline(aes(yintercept=phiFun(b_base, tt)*12), lty=2, col=2) +
	scale_x_continuous("Time (years)", limits=c(0, 16.5), expand=c(0, 0)) +
	scale_y_continuous(expression(h[test]~(year^{-1}))) +
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
  geom_point(data=speeddata[speeddata$early==0.23,], aes(early, speed), size=5, col="red") +
  geom_point(x=0.23, y=coef(lfit)[[2]], size=5) +
	scale_x_continuous("Proportion of early transmission", limits=c(0.1, 0.42), expand=c(0, 0)) +
	scale_y_continuous(expression(Speed~(year^{-1})), limits=c(0, 0.8), expand=c(0, 0)) +
	scale_color_manual(values=c("black", "red")) +
	ggtitle("D") +
	theme(
		legend.position = "none",
		panel.grid = element_blank(),
		panel.border = element_blank(),
		axis.line = element_line()
	)

grid.arrange(arrangeGrob(g1, g2, g3, g4, nrow=2))

