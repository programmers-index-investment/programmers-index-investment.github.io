#!/usr/bin/env Rscript

t <- read.table("./invest_return.tsv", sep="\t", header=FALSE)

x <- as.Date(t$V1, "%m/%d/%Y")
y1 <- as.numeric(gsub(",","", t$V2))/1000000
y2 <- as.numeric(gsub(",","", t$V3))/1000000
png("../images/investment_return/investment_return.png")
y_range <- range(y1, y2)

par(family = "HiraKakuProN-W3")
# mar – A numeric vector of length 4, which sets the margin sizes in the following order: bottom, left, top, and right. The default is c(5.1, 4.1, 4.1, 2.1).

par(mar = c(3, 7, 2, 2))

# mgp – A numeric vector of length 3, which sets the axis label locations relative to the edge of the inner plot window. The first value represents the location the labels (i.e. xlab and ylab in plot), the second the tick-mark labels, and third the tick marks. The default is c(3, 1, 0).

par(mgp = c(3.5, 1, 0))

plot(x, y1, xlab="", ylab="金額[百万円]", type="o", 
     cex.lab=2, cex.axis=1.5, cex.main=1.5, cex=2, ylim=y_range,
     xaxt="n",
     yaxp = c(10, 25, 3),
     pch=1
     )
lines(x, y2, xlab="", type="o", pch=16,
     ylab="金額[百万円]",
     cex.lab=2, cex.axis=1.5, cex.main=1.5, cex=2, ylim=y_range,
     xaxt="n",
# 1,000万円から2,500万円までを3分割で
     yaxp = c(10, 25, 3)
     )
x_years = as.Date(c("2015/1/1", "2016/1/1"), "%Y/%m/%d")
axis(1, x_years, format(x_years, "%Y/%m"), cex=2, cex.axis=1.5, cex.main=1.5, cex.lab=2)

legend(x_years[1], y_range[2], c("評価額", "投資額"), cex=1.5, pch=c(16, 1))
