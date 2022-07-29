# example R script for ancestry proportion distribution figures (box plots and kernel density plots)

setwd("/yourdirectory")

files = list.files()
dat = list()
for (i in 32:49) {
  dat[[i]]= read.csv(paste0(files[i-31]), header=F)$V1
}
par(mar=c(4, 4, 4, 4), xpd=F)
boxplot(dat, xlim=c(32, 49), main="Distribution of ancestry over P2", xlab="generation", 
        ylab="ancestry")

dens_p2 = density(dat[[49]])
plot(density(dat[[32]]), col="red", main="Density of ancestry of individuals", 
     ylim=c(0, max(dens_p2$y)), xlab="ancestry")
points(density(dat[[49]]), col="blue", type="l")
legend("topleft", c("after P1", "after P2"), fill=c("red", "blue"))

# investigating some summary statistics: 
mean(dat[[32]] >= 0.597)
min(dat[[32]])
mean(dat[[32]] == 1)

mean(dat[[49]] >= 0.805)
min(dat[[49]])
mean(dat[[49]] == 1)

mean(dat[[33]] == 1)
