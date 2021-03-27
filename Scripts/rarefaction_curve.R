AC_genome_1X.sum <- read.table("../test_files/AC_genome_sum.txt",sep = "\t",header = T)
library(ggplot2)
AC_genome_1X.sum$group <- factor(AC_genome_1X.sum$group, levels = c("Stomach","Intestine","Rectum","all"),ordered = T)
pdf("rarefaction_curve.pdf")
p1.B <- ggplot(AC_genome_1X.sum, aes(x = sample_number, y = mean,color = group)) +
  geom_line(size = 2) + 
  scale_color_manual(values=c("#F0BA97","#C3C1D7","#A1D5C5","#EE000099")) +
  theme_bw() + 
  theme(panel.grid.major=element_line(colour=NA),
        panel.background = element_rect(fill = "transparent",colour = NA),
        plot.background = element_rect(fill = "transparent",colour = NA),
        panel.grid.minor = element_blank())
dev.off()