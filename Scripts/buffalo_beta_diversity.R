########### PCoA 
library(ggplot2)
library(vegan)
library(ade4)
library(ggpubr)
library(ape)
library(openxlsx)
library(dplyr)
library(foreach)
beta <- function(data, Group){
  datNorm <-decostand(data,"hell")
  datNorm.bray <- vegdist(datNorm, method="bray")
  
  is.euclid(datNorm.bray)
  is.euclid(sqrt(datNorm.bray))
  datNorm.braysq <- sqrt(datNorm.bray)
  
  mds <- cmdscale(datNorm.braysq, k=2, eig=TRUE)
  mds_point <- data.frame(mds$points)
  mds_point$sampleID <- rownames(mds_point)
  ####
  mds_pheno <- merge(mds_point,Group, by = "sampleID");
  
  return (list (datNorm.braysq = datNorm.braysq, mds_pheno = mds_pheno, eig = mds$eig));
}



buffalo_coverage_relative <- read.delim("../test_files/buffalo_coverage_relative.txt",sep = "\t",header = T)
buffalo_group <- read.table("../test_files/group.txt",sep = "\t",header = T)
####
#group
{
  set.seed(1000)
  
  dat.beta <- beta(data = buffalo_coverage_relative, Group = buffalo_group);
  
  p.group <- adonis(dat.beta$datNorm.braysq~group,buffalo_group)
  R2 <- p.group$aov.tab$R2[1];
  R2
  
  pvalue <- p.group$aov.tab$`Pr(>F)`[1];
  pvalue
  ####
  
  C_color.group = c("#f0a197","#a4a2be","#6fa594")
  dat.beta$mds_pheno$group <-  factor(dat.beta$mds_pheno$group, 
                                      levels = c("Stomachs","Intestines","Rectum"),ordered = T)
  
  pdf("buffalo_PCoA_group.pdf")
  p.group <- ggscatter(dat.beta$mds_pheno, x= "X1", y = "X2", 
                       color = "group",
                       ellipse = TRUE,  
                       mean.point = TRUE, star.plot = F,  
                       ellipse.level = 0.75,  
                       ggtheme = theme_minimal(), palette = C_color.group) +
    labs(x = paste("PCoA 1 (", format(100*dat.beta$eig[1]/sum(dat.beta$eig), digits = 4), "%)",sep = ""), 
         y = paste("PCoA 2 (", format(100*dat.beta$eig[2]/sum(dat.beta$eig), digits = 4), "%)",sep = "")) +
    ggtitle("PCoA of parts of DT at MAG(strain) level") 
  p.group <- p.group + theme_bw() 
  dev.off()

}

#source
{
  set.seed(1000)
  source.beta <- beta(data = buffalo_coverage_relative, Group = buffalo_group);
  
  p.source <- adonis(source.beta$datNorm.braysq~source,buffalo_group)
  R2 <- p.source$aov.tab$R2[1];
  R2
  
  pvalue <- p.source$aov.tab$`Pr(>F)`[1];
  pvalue
  ####
  
  C_color = c("#f0a197","#f0a197","#f0a197","#f0a197","#a4a2be","#a4a2be","#a4a2be","#6fa594")
  source.beta$mds_pheno$source <-  factor(source.beta$mds_pheno$source, 
                                          levels = c("Rumen","Reticulum","Omasum","Abomasum","Jejunum","Cecum","Colon","Feces"),ordered = T)
  
  pdf("buffalo_PCoA_source.pdf")
  p <- ggscatter(source.beta$mds_pheno, x= "X1", y = "X2", 
                 shape = "source", color = "source", 
                 ellipse = TRUE,  
                 #ellipse.level = 0.65, 
                 ellipse.alpha = 0,
                 mean.point = T, star.plot = F,  
                 ellipse.level = 0.75,  
                 ggtheme = theme_minimal(), palette = C_color) +
    labs(x = paste("PCoA 1 (", format(100*source.beta$eig[1]/sum(source.beta$eig), digits = 4), "%)",sep = ""), 
         y = paste("PCoA 2 (", format(100*source.beta$eig[2]/sum(source.beta$eig), digits = 4), "%)",sep = "")) +
    ggtitle("PCoA of parts of DT at MAG(strain) level") 
  p <- p + theme_bw()
  dev.off()
  p
  
}