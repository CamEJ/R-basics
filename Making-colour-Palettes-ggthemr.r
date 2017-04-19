## making your own colour palette and theme using gthemr

library(ggplot2)
library(ggthemr)

# first lets print pages of the colors in the plot area so we can find
# the colours we want

# run this to make the show cols function

showcols <-  function (indx = 0:6)
{
  for (ii in unique(indx)) {
    is <- 100 * ii + 1:100
    if (min(is) > length(colors())) {
      cat("Maximum value of arg is", floor(length(colors())/100),
          "\n")
      return(NULL)
    }
    foo <- matrix(colors()[is], nrow = 10)
    par(mar = c(3, 3, 0.25, 0.25))
    plot(1:10, 1:10, type = "n", yaxt = "n", xlab = "", ylab = "")
    axis(2, at = 1:10, lab = 10:1)
    for (j in 1:10) {
      for (i in 1:10) {
        points(j, 11 - i, col = foo[i, j], pch = 16,
               cex = 4)
        text(j, 11 - i - 0.3, foo[i, j], cex = 0.8)
      }
    }
    if (length(indx) > 1 & ii < max(indx))
      readline(paste("Currently showing group", ii, "  CR to continue "))
  }
  invisible(foo)
}

showcols()

colours()

# flip though them and take a look  

# # making the palette
# script from
# http://www.shanelynn.ie/themes-and-colours-for-r-ggplots-with-ggthemr/

# I want to have a dark and light palette so here they are 
# there are 13 colours here, choose as many as you need to plot
# your data. I have 13 time points so 13 colours
# you'll get an error when you go to plot if your palette is not big enough


#13 colours atm
dark_cols <- c('brown4', 'red4', 'orangered1', 'orange1', 'darkgreen', 'darkolivegreen4', 
               'aquamarine4', 'cyan4', 'darkblue', 'magenta4', 'indianred3', 'tan4', 'thistle4')

# 10 colours atm
light_cols <- c('lightgoldenrod1', 'chartreuse2', 'darkolivegreen2', 
               'aquamarine2', 'azure4', 'cornflowerblue', 'mistyrose2', 'salmon', 'sienna1', 'thistle')


# you have to add a colour at the start of your palette for outlining boxes, we'll use a grey:
DarkCols1 <- c("#555555", dark_cols)
# remove previous effects:
ggthemr_reset()
# Define colours for your figures with define_palette
darkCols <- define_palette(
  swatch = DarkCols1, # colours for plotting points and bars
  gradient = c(lower = DarkCols1[1L], upper = DarkCols1[2L]), #upper and lower colours for continuous colours
  background = "white" #defining a grey-ish background 
)
# set the theme for your figures:
ggthemr(darkCols)
# now plot away!! 

# To change to light colour palette

LightCols1 <- c("#555555", light_cols)
ggthemr_reset()
# Define colours for your figures with define_palette
lightCols <- define_palette(
  swatch = LightCols1, # colours for plotting points and bars
  gradient = c(lower = LightCols1[1L], upper = LightCols1[2L]), #upper and lower colours for continuous colours
  background = "white" #defining a grey-ish background 
)
# set the theme for your figures:
ggthemr(lightCols)
  
  
 ## using ggthemr to make a palette of four colours 
  # corresponding to 4 treatments so that
  ## all plots of relating to these treatements have the same palette
  
   use ggthemr to plot with my WP3 colour theme so 4 treatments
# labelled as in all my other plots. 

library(ggthemr)
# define the four colours where black is control, choc4 is tmt2; slateblue is 
  # treatment3 and olivedrab is treatment 4
  
WP3_colsA <- c("black", "chocolate4", "slateblue", "olivedrab")
# add background white (#55555)
WP3_cols <- c("#555555", WP3_colsA)

# define palette
WP3Cols <- define_palette(
  swatch = WP3_cols, # colours for plotting points and bars
  gradient = c(lower = WP3_cols[1L], upper = WP3_cols[2L]), #upper and lower colours for continuous colours
  background = "white" #defining a grey-ish background 
)

# set new col theme as current

ggthemr(WP3Cols)    
