alpha_1X.group <- read.table("../test_files/alpha.txt",sep = "\t",header = T)
#shannon
{
  pdf("shannon_group.pdf")
  p_shannon_1X_group <- ggplot(alpha_1X.group,aes(x=group,y=Shannon,fill=group)) + 
    geom_boxplot() + scale_fill_manual(values = c("#F0BA97","#C3C1D7","#A1D5C5")) +
    theme_bw() + 
    theme(panel.grid.major = element_blank(),
          panel.grid.minor = element_blank()) +
    stat_compare_means(comparisons = buffalo_comparison.old, label = "p.signif")
  
  dev.off()
  
  pdf("shannon_source.pdf")
  p_shannon_1X_source <- ggplot(alpha_1X.group,aes(x=source,y=Shannon,fill=source)) + 
    geom_boxplot() + scale_fill_jco() +
    theme_bw() + 
    theme(panel.grid.major = element_blank(),
          panel.grid.minor = element_blank())
  
  dev.off()
  
}
#simpson
{
  pdf("simpson_group.pdf")
  p_simpson_1X_group <- ggplot(alpha_1X.group,aes(x=group,y=Simpson,fill=group)) + 
    geom_boxplot() + scale_fill_manual(values = c("#F0BA97","#C3C1D7","#A1D5C5")) +
    theme_bw() + 
    theme(panel.grid.major = element_blank(),
          panel.grid.minor = element_blank()) +
    stat_compare_means(comparisons = buffalo_comparison, label = "p.signif")
  dev.off()
  
  pdf("simpson_source.pdf")
  p_simpson_1X_source <- ggplot(alpha_1X.group,aes(x=source,y=Simpson,fill=source)) + 
    geom_boxplot() + scale_fill_jco() +
    theme_bw() + 
    theme(panel.grid.major = element_blank(),
          panel.grid.minor = element_blank())
  dev.off()
}