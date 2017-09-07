## Adding together data from replicate row IDs
# using dplyr

## all from here, a really nice tutorial
## http://genomicsclass.github.io/book/pages/dplyr_tutorial.html



require(dplyr)
# grouping and summarising variables within a df called 'abund'

abundTot <- abund %>% # choose name of new df (here it's abundTot) to which new data will be put
  group_by(Sample) %>% # group by sample
  summarise(abund = sum(Abundance),  # then use summarise to work out mean etc for each diff group
            Tp = first(SamplingTime), # where each of these will be a new column in new df abundTot
            Tmt = first(Treatment.A),
            total = n())

# select by more than one variable
# if I have 10 time point and within each time point there are 4 treatments
# and i want to get mean and sd for each tmt at each time point then
# i need to group first by timepoint, then be treatment, as below: 

Avs <- m %>% 
  group_by(timepoint, Treatment) %>% # in the order you want them grouped
  summarise(Mbr = mean(Bresp), 
            SdBr = sd(Bresp))


# using subset() to pick out all rows for a particular variable value
# eg here I want to pick out all the rows for a variable Otu00015 that
# is listed in the colum OTU of dataframe called m_df


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

