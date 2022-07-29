# example R script for critical migration rate estimation figures

setwd("/yourdirectory")
dat = read.csv("bands.txt")

colours = rainbow(6)
par(mar=c(5, 4, 4, 9), xpd=FALSE) # create space for legend
plot(dat$effective_generation, dat$band1, type="l", col=colours[1], pch=19, 
     xlab="generation", ylab="ancestry", main="Genealogical ancestry across space", 
     ylim=c(0, 1)
     )
abline(v=32, lty=3)
abline(h=0.9, lty=3)
for (i in 2:(ncol(dat)-1)) {
  points(dat$effective_generation, dat[, i+1], type="l", col=colours[i], pch=19)
}
text = c()
for (i in 1:length(colours)) {
  text = c(text, paste("band", i))
}
par(xpd=TRUE)
legend("topright", rev(text), fill=rev(colours), inset=c(-0.32, 0))

