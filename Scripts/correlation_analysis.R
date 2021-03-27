library(corrplot)
library(ggcorrplot)
all_tax <- read.table("../test_files/tax_abundance.txt",sep = "\t",header = T)
#Rumen
{
  comparison.rumen <- all_tax[which(all_tax$source == "Rumen"),c(4,7)]
  comparison.rumen.c <- cor(comparison.rumen,method = "spearman")
  cor_p.rumen <- cor_pmat(comparison.rumen)
  p.comparison.rumen <- corrplot(comparison.rumen.c,method = "color",sig.level = 0.05,
                                 p.mat = cor_p.rumen,tl.col = "black",addCoef.col = "black")
}
#Reticulum
{
  comparison.Reticulum <- all_tax[which(all_tax$source == "Reticulum"),c(4,7)]
  comparison.Reticulum.c <- cor(comparison.Reticulum,method = "spearman")
  cor_p.Reticulum <- cor_pmat(comparison.Reticulum)
  p.comparison.Reticulum <- corrplot(comparison.Reticulum.c,method = "color",sig.level = 0.05,
                                     p.mat = cor_p.Reticulum,tl.col = "black",addCoef.col = "black")
}
#Omasum
{
  comparison.Omasum <- all_tax[which(all_tax$source == "Omasum"),c(4,7)]
  comparison.Omasum.c <- cor(comparison.Omasum,method = "spearman")
  cor_p.Omasum <- cor_pmat(comparison.Omasum)
  p.comparison.Omasum <- corrplot(comparison.Omasum.c,method = "color",sig.level = 0.05,
                                  p.mat = cor_p.Omasum,tl.col = "black",addCoef.col = "black")
}
#Abomasum
{
  comparison.Abomasum <- all_tax[which(all_tax$source == "Abomasum"),c(4,7)]
  comparison.Abomasum.c <- cor(comparison.Abomasum,method = "spearman")
  cor_p.Abomasum <- cor_pmat(comparison.Abomasum)
  p.comparison.Abomasum <- corrplot(comparison.Abomasum.c,method = "color",sig.level = 0.05,
                                    p.mat = cor_p.Abomasum,tl.col = "black",addCoef.col = "black")
}
#Jejunum
{
  comparison.Jejunum <- all_tax[which(all_tax$source == "Jejunum"),c(4,7)]
  comparison.Jejunum.c <- cor(comparison.Jejunum,method = "spearman")
  cor_p.Jejunum <- cor_pmat(comparison.Jejunum)
  p.comparison.Jejunum <- corrplot(comparison.Jejunum.c,method = "color",sig.level = 0.05,
                                   p.mat = cor_p.Jejunum,tl.col = "black",addCoef.col = "black")
}
#Colon
{
  comparison.Colon <- all_tax[which(all_tax$source == "Colon"),c(4,7)]
  comparison.Colon.c <- cor(comparison.Colon,method = "spearman")
  cor_p.Colon <- cor_pmat(comparison.Colon)
  p.comparison.Colon <- corrplot(comparison.Colon.c,method = "color",sig.level = 0.05,
                                 p.mat = cor_p.Colon,tl.col = "black",addCoef.col = "black")
}
#Cecum
{
  comparison.Cecum <- all_tax[which(all_tax$source == "Cecum"),c(4,7)]
  comparison.Cecum.c <- cor(comparison.Cecum,method = "spearman")
  cor_p.Cecum <- cor_pmat(comparison.Cecum)
  p.comparison.Cecum <- corrplot(comparison.Cecum.c,method = "color",sig.level = 0.05,
                                 p.mat = cor_p.Cecum,tl.col = "black",addCoef.col = "black")
}
#Feces
{
  comparison.Feces <- all_tax[which(all_tax$source == "Feces"),c(4,7)]
  comparison.Feces.c <- cor(comparison.Feces,method = "spearman")
  cor_p.Feces <- cor_pmat(comparison.Feces)
  p.comparison.Feces <- corrplot(comparison.Feces.c,method = "color",sig.level = 0.05,
                                 p.mat = cor_p.Feces,tl.col = "black",addCoef.col = "black")
}
#Stomach
{
  comparison.Stomach <- all_tax[which(all_tax$group == "Stomachs"),c(4,7)]
  comparison.Stomach.c <- cor(comparison.Stomach,method = "spearman")
  cor_p.Stomach <- cor_pmat(comparison.Stomach)
  p.comparison.Stomach <- corrplot(comparison.Stomach.c,method = "color",sig.level = 0.05,
                                   p.mat = cor_p.Stomach,tl.col = "black",addCoef.col = "black")
}
#Intestine
{
  comparison.Intestine <- all_tax[which(all_tax$group == "Intestines"),c(4,7)]
  comparison.Intestine.c <- cor(comparison.Intestine,method = "spearman")
  cor_p.Intestine <- cor_pmat(comparison.Intestine)
  p.comparison.Intestine <- corrplot(comparison.Intestine.c,method = "color",sig.level = 0.05,
                                     p.mat = cor_p.Intestine,tl.col = "black",addCoef.col = "black")
}
#Rectum
{
  comparison.Rectum <- all_tax[which(all_tax$group == "Rectum"),c(4,7)]
  comparison.Rectum.c <- cor(comparison.Rectum,method = "spearman")
  cor_p.Rectum <- cor_pmat(comparison.Rectum)
  p.comparison.Rectum <- corrplot(comparison.Rectum.c,method = "color",sig.level = 0.05,
                                  p.mat = cor_p.Rectum,tl.col = "black",addCoef.col = "black")
}

