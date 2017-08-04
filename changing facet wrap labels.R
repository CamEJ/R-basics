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



