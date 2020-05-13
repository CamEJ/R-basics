# for merging two different sized datasets
# and thereby making a new one where only 
# samples from big data set that match sample
# names from small dataset


dataFull <- read.table(file="HEADEDconsTax.txt", header=T)
# this is a full dataframe of ALL my otus with their taxonomy information

dataCut <- read.table(file="node-ids.txt", header=T)
# this is a dataframe of just one column which contains just some of the OTUs
# that are in the df 'dataFull'

# both df's need to have one variable that matches and will be used to join/merge on. 
# this variable must have same name in both dfs. Here it is OTU
zz <- merge(dataCut, dataFull, by = "OTU")

## zz should be a df containing on the OTUS listed in dataCut, but now,
## those OTUS also have also the taxonomy from teh cons.taxonomy file. 


# can also do left_join from dplyr
# where you want to keep all rows of left df, all rows that match b/w the two but 
# not all rows of right df that dont match left

aBitBigger = left_join(bigger, smaller, by='ID')

# there a number of variants of this in dplyr - see here 
# https://dplyr.tidyverse.org/reference/join.html
