#COG
COG_Fun <- read.table("../test_files/COG_Fun.txt",header = F,sep = "\t")
colnames(COG_Fun) <- c("Code","Name","nums")
pdf("COG.pdf")
p.COG_Fun <-ggplot(COG_Fun,mapping = aes(x="Name",y=nums, fill=Name)) + 
  geom_bar(width = 1, stat = "identity",position = "stack") +coord_polar("y", start=0) +
  #scale_fill_manual(values=c("#0000FF","#BEBEBE","#FFC300")) +
  scale_fill_npg(alpha = 0.6) +
  coord_polar("y", start=0) +
  blank_theme +
  #scale_fill_npg() +
  theme(axis.text.x=element_blank()) +
  geom_text(stat="identity",aes(y=nums, label = scales::percent(nums/sum(COG_Fun$nums))), size=4, position=position_stack(vjust = 0.5))

dev.off()
