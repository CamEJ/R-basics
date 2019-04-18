# Change column names

# if you want to change the column name based on the old column name
# instead of saying a number which column it is.
colnames(dataframe)[which(names(dataframe) == "columnName")] <- "newColumnName"

# by column number 
colnames(dataframe)[2] <- "NewColName"



