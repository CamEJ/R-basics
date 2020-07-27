# Changing labels over the facet wrap panels in ggplot

#  to change actual text, make vector of names you want

# make labels you want to appear at top of facet wrap boxes/panels

Alpha_names <- c(
  `elongation` = "Elongation \n",
  `ripening` = "Ripening \n"
)

# where names in `` are old names and in "" are the new names
# now when you do facet_wrap, add 'labeller' argument as below where my labe names are
# called 'Alpha names'
ko = k + facet_wrap(~Discrim, scales="free", labeller = as_labeller(Alpha_names)) 


# To change text colour or size and change background, eg to remove grey colour
# do this in theme()

plot + theme(
        strip.text.x = element_text(size = 18, colour = "black"),# change font of facet label
          strip.background =  element_rect(fill = "white"), # remove white from panel tops
          )


## subscript & other scientific notation in facet labels
# basically by using labeller = label_parsed in facet wrap after id'ing labels

# here a df called AvGHG which looks like this
#     Day trt     Gas     MEAN      SE       unit                                
#     0 control F_CH4  -0.00733   0.000212  g/m2/d        
#     0 control F_CO2  196.       11.0      g/m2/d  

# with the data, i want to plot a line chart of  mean gas over time (Day)
# with data facet-wrapped by the different gases measured
# normally, would just do facet_wrap(~Gas) but i want after gas name
# the unit meaured with superscript in instead of per kg for example. 
# so i add a variable called 'facets' to my AvGHG df where i put IN THE CORRECT ORDER
# the new labels I want along with units and scientific notation
AvGHG$facets = factor(AvGHG$Gas, labels = c(
  "Methane~(g~m^{-2}~day^{-1})", 
  "Carbon~dioxide~(g~m^{-2}~day^{-1})", 
  "Nitrous~oxide~(mg~m^{-2}~day^{-1})"))

# now plot as normal and add 'label_parsed'argument
 ggplot(AvGHG, aes(x=Day, y=MEAN, colour=trt)) +
  geom_line(size=0.8) +
  geom_errorbar(aes(ymin=MEAN-SE, ymax=MEAN+SE), width=.25) +
  geom_point(size=2,color='black', shape=21, aes(fill=trt)) +
  facet_wrap(~facets, labeller = label_parsed,scales="free_y",ncol=1)

## note: make sure labels in correct order or you will wrongly label your facets
# should always plot raw version first w/o label edits as a reference.


