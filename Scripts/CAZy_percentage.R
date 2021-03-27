library(ggplot2)
###-buffalo--###
#percentage
data.merge.all <- read.table("/mnt/raid7/wangteng/buffalo/MEABDT/test_files/CAZy_percentage.txt",header = T,sep = "\t")
data.merge.all$Source <- factor(data.merge.all$Source, levels=c("all","Rectum","Intestines","Stomachs"),order=T)
pdf("CAZy_percentage.pdf")
p <- ggplot( data = data.merge.all, mapping=aes(x=CAZy, y= percent, fill = Source) )+
  geom_boxplot()+
  scale_fill_manual(values=c("#EE000099", "#A1D5C5", "#C3C1D7", "#F0BA97"))+
  scale_x_discrete(limits=unique(data.merge.all$CAZy))+
  guides(fill=guide_legend(reverse=TRUE))+
  coord_flip() + 
  labs( title = "Percentage identity against CAZy", x = NULL, y = "Percentage identity")
p + theme_set(theme_bw()) + theme(panel.grid.major=element_line(colour=NA)) +
  theme(legend.position="right") 
dev.off()
#proportion
CAZy_level1 <- read.table("/mnt/raid6/wangteng/buffalo_gut/bins_downstream_analysis/CAZy/dbCAN2/CAZy_level1.txt",header = F,sep = "\t")
colnames(CAZy_level1) <- c("query_name","CAZy_ID","identical")

CAZy_num_proportion <- data.frame(table(CAZy_level1$CAZy_ID))

blank_theme <- theme_minimal()+
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.border = element_blank(),
    panel.grid=element_blank(),
    axis.ticks = element_blank(),
    plot.title=element_text(size=14, face="bold")
  )
pdf("CAZy_proportion.pdf")
p.CAZy_num_proportion <-ggplot(CAZy_num_proportion,mapping = aes(x="Var1",y=Freq, fill=Var1)) + 
  geom_bar(width = 1, stat = "identity",position = "stack") +coord_polar("y", start=0) +
  #scale_fill_manual(values=c("#0000FF","#BEBEBE","#FFC300")) +
  scale_fill_lancet(alpha = 0.6) +
  coord_polar("y", start=0) +
  blank_theme +
  #scale_fill_npg() +
  theme(axis.text.x=element_blank()) +
  geom_text(stat="identity",aes(y=Freq, label = scales::percent(Freq/sum(CAZy_num_proportion$Freq))), size=4, position=position_stack(vjust = 0.5))

dev.off()

###---buffalo vs cattle---###
#based on all CAZy abundance
{
  library(ggsci)
  buffalo_rumen <- read.table("../test_files/buffalo_CAZy_rumen.txt",header = F,sep = "\t")
  colnames(buffalo_rumen) <- c("CAZy_ID","abundance","group")
  buffalo_rumen$group <- "buffalo"
  cattle_rumen <- read.table("../test_files/CAZy_abundance_cattle.txt",header = F,sep = "\t")
  colnames(cattle_rumen) <- c("CAZy_ID","abundance","group")
  CAZy_abundance.rumen <- rbind(buffalo_rumen,cattle_rumen)
  
  pdf("BC_C.pdf")
  p.rumen_CAZy <- ggplot(CAZy_abundance.rumen,aes(x=group,y=abundance,fill = group)) + geom_boxplot()+
    scale_fill_npg() + theme_bw()+
    theme(panel.grid.major = element_blank(),
          panel.grid.minor = element_blank()) +
    stat_compare_means(comparisons = list(c("buffalo","cattle")), label = "p.signif") +
    facet_wrap(~CAZy_ID,nrow = 2,scales = "free")
  dev.off()
}

#based on all protein abundance
{
  library(ggsci)
  buffalo_rumen.p <- read.table("../test_files/buffalo_CAZy_rumen_P.txt",header = F,sep = "\t")
  buffalo_rumen.p <- buffalo_rumen.p[,-c(3,4)]
  colnames(buffalo_rumen.p) <- c("CAZy_ID","abundance")
  buffalo_rumen.p$group <- "buffalo"
  cattle_rumen.p <- read.table("../test_files/CAZy_abundance_cattle_P.txt",header = F,sep = "\t")
  colnames(cattle_rumen.p) <- c("CAZy_ID","abundance")
  cattle_rumen.p$group <- "cattle"
  CAZy_abundance.rumen.p <- rbind(buffalo_rumen.p,cattle_rumen.p)
  
  pdf("BC_P.pdf")
  p.rumen_CAZy.p <- ggplot(CAZy_abundance.rumen.p,aes(x=group,y=abundance,fill = group)) + geom_boxplot()+
    scale_fill_npg() + theme_bw()+
    theme(panel.grid.major = element_blank(),
          panel.grid.minor = element_blank()) +
    stat_compare_means(comparisons = list(c("buffalo","cattle")), label = "p.signif") +
    facet_wrap(~CAZy_ID,nrow = 2,scales = "free")
  dev.off()
}
