library(ggplot2)
mapping_rate_all <- read.table("../test_files/mapping_rate_all.txt",sep = "\t",header = T)
mapping_rate_all$data <- factor(mapping_rate_all$data, levels = c("buffalo", "cattle","BFAP", "human","pig","chicken"),ordered = T)
mapping_rate_all$section <- factor(mapping_rate_all$section, levels = c("All","Rectum","Intestines","Stomachs"),ordered = T)

pdf("mapping_rate.pdf")
p1.H <- ggplot(mapping_rate_all,aes(x=data, y=mapping_rate,fill = section)) +
  geom_boxplot() + coord_flip() + theme_bw() + 
  theme(panel.grid.major=element_line(colour=NA),
        panel.background = element_rect(fill = "transparent",colour = NA),
        plot.background = element_rect(fill = "transparent",colour = NA),
        panel.grid.minor = element_blank()) +
  scale_y_continuous(breaks = seq(0,100,10),limits = c(0,100)) +
  scale_fill_manual(values=c("#EE000099","#A1D5C5","#C3C1D7","#F0BA97")) 
dev.off()
