MAGs.information_all <- read.table("../test_files/MAGs_informations.txt",sep = "\t",header = T)
library(ggplot2)
library(ggsci)
#dot plot of Completeness and Contamination
pdf("quality_dot.pdf")
p1.C <- ggplot(MAGs.information_all,aes(x=completeness,y=contamination,color = quality)) +
  geom_point(size=0.9,alpha=0.9) +
  scale_color_manual(values=c("#AB0D16","#93818C", "#497FB1")) + 
  theme_bw() +
  theme(panel.grid.major=element_line(colour=NA),
        panel.background = element_rect(fill = "transparent",colour = NA),
        plot.background = element_rect(fill = "transparent",colour = NA),
        panel.grid.minor = element_blank()) +
  scale_x_continuous(breaks = seq(70,100,5),limits = c(80,100)) +
  guides(color = F)
dev.off()

#pie plot of the MAGs
pdf("quality_pie.pdf")
blank_theme <- theme_minimal()+
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.border = element_blank(),
    panel.grid=element_blank(),
    axis.ticks = element_blank(),
    plot.title=element_text(size=14, face="bold")
  )
p1.D <-ggplot(MAGs.information_all,mapping = aes(x="quality", fill=quality)) + 
  geom_bar(width = 1, stat = "count",position = "stack") +coord_polar("y", start=0) +
  #scale_fill_manual(values=c("#0000FF","#BEBEBE","#FFC300")) +
  scale_fill_manual(values=c("#AB0D16","#93818C", "#497FB1")) +
  blank_theme +
  #scale_fill_npg() +
  theme(axis.text.x=element_blank()) +
  geom_text(stat="count",aes(label = scales::percent(..count../sum(..count..))), size=4, position=position_stack(vjust = 0.5))


dev.off()

#N50
pdf("N50.pdf")
p1.E <- ggplot(MAGs.information_all,aes(x=N50)) + geom_histogram(binwidth = 0.05,fill="#69b3a2", color="#e9ecef", alpha=0.9)+
  theme_bw()+
  theme(panel.grid.major=element_line(colour=NA),
        panel.background = element_rect(fill = "transparent",colour = NA),
        plot.background = element_rect(fill = "transparent",colour = NA),
        panel.grid.minor = element_blank()) +
  labs(x="N50(log10)",y="Number of MAGs") + scale_x_log10()
dev.off()

#Size
pdf("Size.pdf")
p1.F <- ggplot(MAGs.information_all,aes(x=size))+ geom_histogram(binwidth = 100000,fill="#5666DC", color="#e9ecef", alpha=0.9)+
  theme_bw()+
  theme(panel.grid.major=element_line(colour=NA),
        panel.background = element_rect(fill = "transparent",colour = NA),
        plot.background = element_rect(fill = "transparent",colour = NA),
        panel.grid.minor = element_blank()) +
  labs(x="Size",y="Number of MAGs") #+ scale_x_log10() 
dev.off()
#Number of contigs
pdf("contigs.pdf")
p1.G <- ggplot(MAGs.information_all,aes(x=contig_number)) + geom_histogram(binwidth=15,fill="#8C94A6", 
                                                                           color="#e9ecef", alpha=0.9)+
  theme_bw()+
  theme(panel.grid.major=element_line(colour=NA),
        panel.background = element_rect(fill = "transparent",colour = NA),
        plot.background = element_rect(fill = "transparent",colour = NA),
        panel.grid.minor = element_blank()) +
  labs(x="Number of contigs",y="Number of MAGs")
dev.off()
