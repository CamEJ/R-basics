## Adding together data from replicate row IDs
# using dplyr

## all from here, a really nice tutorial
## http://genomicsclass.github.io/book/pages/dplyr_tutorial.html



require(dplyr)

m_df <- tbl_df(m)

abund <- select(m_df, Sample, Abundance, Treatment.A, SamplingTime)


abundTot <- abund %>% 
  group_by(Sample) %>%
  summarise(abund = sum(Abundance), 
            Tp = first(SamplingTime),
            Tmt = first(Treatment.A),
            total = n())



# pick out one OTU

OTU15 <- subset(m_df, OTU=="Otu000015")

# Picking out >1  OTUs and putting them in new df called OTU_thaum

OTU_thaum <- subset(m_df, !(OTU %in% c("Otu000015","Otu000988","Otu002033","Otu003878","Otu004389")))

# or if that doesnt work
AOA <- filter(A_df, OTU %in% c("Otu000015", "Otu000021"))

# choosing just some columns of data from whole df. Dont have to do this. 
abund <- select(m_df, Sample, Abundance, Treatment.A, SamplingTime)

##  Now add together abundance data from different OTUs to give
# one abundance per sample
## so I've chosen to group by Sample
## and for that group im gonna add all abundances and put them in a colum
# called abund. I'll also put a column called Tp with Sampling time
# info & Tmt for treatment info. i do this using first() as all members of
# grouping (ie sample groups) will be from same timepoint and have same tmt


ThaumAbundTot <- OTU_thaum %>% 
  group_by(Sample) %>%
  summarise(abund = sum(Abundance), 
            Tp = first(SamplingTime),
            Tmt = first(Treatment.A),
            total = n())

