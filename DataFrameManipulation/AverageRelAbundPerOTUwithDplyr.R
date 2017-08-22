## average rel abund for each OTU

##### DNA ######

yy <- read.csv(file='untrimmedPhyloseqOTU-DNAlime.csv', header=T )


abundAv <- yy %>% 
  group_by(OTU) %>%
  summarise(abund = mean(Abundance), 
            size = first(Size))

write.csv(abundAv, file="AvAbund_DNA_OTUs")


## av abund per phyla


abundAvbyPhy <- yy %>% 
  group_by(Pylum) %>%
  summarise(mean_abund = mean(Abundance), 
            size = mean(Size),
            max_abund = max(Abundance))

write.csv(abundAvbyPhy, file="AvAbund_DNA_byPhylum.csv")


###### cDNA #######

yy <- read.csv(file='untrimmedPhyloseqOTU-cDNAlime.csv', header=T )


abundAv <- yy %>% 
  group_by(OTU) %>%
  summarise(abund = mean(Abundance), 
            size = first(Size))

write.csv(abundAv, file="AvAbund_cDNA_OTUs.csv")


abundAvbyPhy <- yy %>% 
  group_by(Phylum) %>%
  summarise(mean_abund = mean(Abundance), 
            size = mean(Size),
            max_abund = max(Abundance))

write.csv(abundAvbyPhy, file="AvAbund_cDNA_byPhylum.csv")

