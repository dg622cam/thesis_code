# example R script for critical migration rate estimation figures

# results obtained from run_reps.sh

mig_per_gen = c(1000, 2000, 3000, 4000, 5000, 
                6000, 7000, 8000, 9000, 10000, 
                11000, 12000, 13000, 14000, 15000)

avg_ancestry_0.4 = c(0.412357, 0.602592, 0.708735, 0.770537, 0.814576, 
                     0.843215, 0.865086, 0.879715, 0.893329, 0.908003, 
                     0.914441, 0.920805, 0.928559, 0.933015, 0.938877)

avg_ancestry_0.6 = c(0.415234, 0.603883, 0.713453, 0.776136, 0.821243, 
                     0.846541, 0.87007, 0.890327, 0.900317, 0.90981, 
                     0.919925, 0.928831, 0.933719, 0.939561, 0.945417)

avg_ancestry_0.8 = c(0.409094, 0.609174, 0.717726, 0.784098, 0.828113, 
                     0.855928, 0.876346, 0.893204, 0.907108, 0.91881, 
                     0.927012, 0.93379, 0.939864, 0.944028, 0.948361)

(avg_ancestry_0.8[9] - avg_ancestry_0.6[9]) * 100
(avg_ancestry_0.6[9] - avg_ancestry_0.4[9]) * 100

par(mar=c(4, 4, 4, 4), xpd=F)
plot(mig_per_gen, avg_ancestry_0.8, xlim=c(4000, 15000), type="b", 
     pch=19, cex=0.7, main="Average ancestry of population after P1", 
     xlab="number of migrants per gen", ylab="average ancestry", 
     col="red", 
     ylim=c(0.7, 1)
     )
abline(h=0.9, lty=3)
points(mig_per_gen, avg_ancestry_0.6, type="b", pch=19, cex=0.7, 
       col="blue")
points(mig_per_gen, avg_ancestry_0.8, type="b", pch=19, cex=0.7, 
       col="green")
legend("bottomright", c("height 0.4", "height 0.6", "height 0.8"), fill=c("red", "blue", "green"))
