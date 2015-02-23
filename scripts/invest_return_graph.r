#!/usr/bin/env Rscript

t <- read.table("./invest_return.tsv", sep="\t", header=FALSE)

x <- as.Date(t$V1, "%m/%d/%Y")
y1 <- as.numeric(gsub(",","", t$V2))/1000000
y2 <- as.numeric(gsub(",","", t$V3))/1000000
png("../source/img/investment_return/investment_return.png")
y_range <- range(y1, y2)

par(mar = c(3, 7, 2, 2))
par(mgp = c(3.5, 1, 0))

plot(x, y1, xlab="", ylab="金額[百万円]", type="o", 
     cex.lab=2, cex.axis=1.5, cex.main=1.5, cex=2, ylim=y_range,
     xaxt="n",
     yaxp = c(11, 16, 5),
     pch=1
     )
lines(x, y2, xlab="", type="o", pch=16,
     ylab="金額[百万円]",
     cex.lab=2, cex.axis=1.5, cex.main=1.5, cex=2, ylim=y_range,
     xaxt="n",
# 1,100万円から1,600万円までを5分割で
     yaxp = c(11, 16, 5)
     )
x_years = as.Date(c("2014/8/1", "2015/1/1"), "%Y/%m/%d")
axis(1, x_years, format(x_years, "%Y-%m"), cex=2, cex.axis=1.5, cex.main=1.5, cex=2, cex.lab=2)

legend(x_years[1], y_range[2], c("評価額", "投資額"), cex=1.5, pch=c(16, 1))
