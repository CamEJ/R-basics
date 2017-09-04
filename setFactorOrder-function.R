## Function for defining the order you want your
# treatments to appear in plots. Because usually
# ggplot by default plots them in alphabetic order 

# function originally found at:
# https://stackoverflow.com/questions/19384304/is-there-a-way-to-order-the-ggplot2-facet-grid-subplots

# run this function
   
setFactorOrder <- function(x, order=sort(levels(x))) { 
  # Returns a factor ordered by `order`.  
  # If order is missing, defaults to `levels(x)` if available, else to `sort(unique(x))`
  # Useful for ggplot and elsewhere were ordering is based on the order of the levels
  
  if (!is.factor(x)) {
    warning("`x` is not a factor. Will coerce.")
    levs <- sort(unique(x))
    if (missing(order))
      order <- levs
  } else {
    levs <- levels(x)
  }
  
  # any values in order, not in levels(x)
  NotInx <- setdiff(order, levs)
  
  if (length(NotInx)) {
    warning ("Some values not in x:\n", paste(NotInx, collapse=", "))
  }
  
  # levels(x) not explicitly named in order
  Remaining <-  setdiff(levs, order)
  
  order <- c(setdiff(order, NotInx), Remaining)
  
  factor(x, level=order)
}

### example usage. Now it's run you can use it. 

# NameOfMyDataSet = your dataset eg abund table with meta data included
# ColumnID = the name/header of the column containing the factor (eg timepoint/tmt) 
# in which you want to base the order of your plot on
# then in c() argument you put the factors IN THE ORDER you want them to appear. 

#NameOfMyDataSet[["ColumnID"]] <- setFactorOrder(NameOfMyDataSet[["ColumnID"]], c("Variable4", "Variable2", "Variable3", "Variable1"))

## actual example: where sampling time was on x axis
## and treatment.A was on y axis so I defined the order for both. 

#yy[["SamplingTime"]] <- setFactorOrder(yy[["SamplingTime"]], c("T0", "T2", "T3", "T7", "T8", "T11", "T13"))

#yy[["Treatment.A"]] <- setFactorOrder(yy[["Treatment.A"]], c("Control", "Slurry", "Flood", "Flood+Slurry"))




