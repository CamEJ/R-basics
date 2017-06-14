

## Adding together data from replicate row IDs
# using dplyr

## all from here, a really nice tutorial
## http://genomicsclass.github.io/book/pages/dplyr_tutorial.html



require(dplyr)

m_df <- tbl_df(m)

abund <- select(m_df, Sample, Abundance, Treatment.A, SamplingTime)


abundTot <- abund %>% 
  group_by(Sample) %>%
  summarise(avg_abund = sum(Abundance), 
            Tp = first(SamplingTime),
            Tmt = first(Treatment.A),
            total = n())

