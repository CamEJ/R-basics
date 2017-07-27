# for merging two different sized datasets
# and thereby making a new one where only 
# samples from big data set that match sample
# names from small dataset


dataFull <- read.table(file="HEADEDconsTax.txt", header=T)
# this is a full dataframe of ALL my otus with their taxonomy information

dataCut <- read.table(file="node-ids.txt", header=T)
# this is a dataframe of just one column which contains just some of the OTUs
# that are in the df 'dataFull'

zz <- merge(dataCut, dataFull, by = "OTU")

## zz should be a df containing on the OTUS listed in dataCut, but now,
## those OTUS also have also the taxonomy from teh cons.taxonomy file. 

