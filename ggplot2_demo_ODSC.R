#Jared Lander, Lander Analytics
#“Workshop:ggplot2: from scratch to compelling graphs”

library(ggplot2)
library(ggthemes)
data(diamonds)
head(diamonds)

#the simple way of plotting in R
#plot(price ~ carat, data=diamonds)
#hist(diamonds$price)
#boxplot(diamonds$price)


ggplot(diamonds, aes(x=carat, y=price)) + geom_point()

#use aes() to map values to color property
ggplot(diamonds, aes(x=carat, y=price)) + geom_point(aes(color=cut))

#hard coded color variable
ggplot(diamonds, aes(x=carat, y=price)) + geom_point(color='blue')

#histagram automatically calcualtes heights. No Y value necessary
ggplot(diamonds) + geom_histogram(aes(x=price))

#color property sets border on 2d objects, fill sets fill color
ggplot(diamonds) + geom_histogram(aes(x=price), fill='red', color='blue')

ggplot(diamonds) + geom_density(aes(x=price), fill='grey50')



#compare the aesthetics of the following 2 examples
#when you specify aes() inside ggplot function, it applies to all layers
ggplot(diamonds, aes(x=carat, y=price, color=cut)) + geom_point(aes(color=cut)) +
  geom_smooth()

ggplot(diamonds, aes(x=carat, y=price)) + geom_point(aes(color=cut)) +
  geom_smooth()
###########


ggplot(diamonds, aes(x=carat, y=price)) + 
  geom_point(aes(color=cut), shape=1, size=2, alpha=1/3) +
  geom_smooth()



# we can also break data up into small multiples or facets! 
#assign base function to a variable! 
g <- ggplot(diamonds, aes(x=carat, y=price, color=cut))
g + geom_point() + facet_wrap( ~ cut)

#1d row or col of facets
g + geom_point() + facet_wrap( ~ cut, nrow=1, scales='free') #also try nrow=1

# 2d grid of facets
g + geom_point() + facet_grid(color ~ clarity)


#scales='free' argument allows the scale of the axis of individual facets to vary
#scales='free_y' allows free y axis and fixed x axis
# research forumla notation (use of ~ )....


#compare the 2 following examples
ggplot(diamonds, aes(x=price)) + geom_histogram() + 
  facet_wrap(~cut)

# using free scales is totally misleading, 
#at a glance suggests all cuts of diamonds are the same price
ggplot(diamonds, aes(x=price)) + geom_histogram() + 
  facet_wrap(~cut, scales = 'free')
##############




#boxplots...
ggplot(diamonds, aes(x=1, y=price)) + geom_boxplot()
ggplot(diamonds, aes(x=cut, y=price)) + geom_boxplot()
#..vs violins (more informative!)
ggplot(diamonds, aes(x=cut, y=price)) + geom_violin()


#more on violin plots!

ggplot(diamonds, aes(x=cut, y=price)) + geom_violin() +
  geom_point() #when we add geom_point, the x axis is discrete, so not very helpful

#usingjittering will make the points more useful to show their density
ggplot(diamonds, aes(x=cut, y=price)) +
  geom_jitter(alpha=1/4) +
  geom_violin(alpha=1/2, draw_quantiles = .5) #also, the order matters! put the violin on top to make it more useful



g1 <- ggplot(diamonds, aes(x=carat, y=price)) +
  geom_point(aes(color=cut))

# style your plots with gg_themes
g1 + theme_economist()
g1 + theme_fivethirtyeight()
g1 + theme_wsj() + scale_color_wsj()
g1 + theme_bw()


# labels
g2 <-  ggplot(diamonds, aes(x=carat, y=price)) +
  geom_point()

g2 + labs(x='Carat', y='Price ($)', title='Price by Carat')
#alternatively
g2 + xlab('Carat') + ylab('Price ($)') + ggtitle('Price by Carat')

#transformations
# add dollar sign to labels
g2 + labs(x='Carat', y='Price', title='Price by Carat') + 
  scale_y_continuous(label=scales::dollar)  
#comma delimit numbers
g2 + labs(x='Carat', y='Price ($)', title='Price by Carat') + 
  scale_y_continuous(label=scales::comma)  
#note the :: syntax allows you to use function from package you haven't loaded



g1 + scale_color_brewer()
#brewer is a color scale for color blind (i think)
# see other scale_color_ functions

#move the legend to the bottom
g1 + theme(legend.position='bottom')


#zooming
g3  <- g2 + geom_smooth()

# xlim zooms by removing data.

g3 + xlim(c(0, 3))
#this is problematic because the smoothing curve no longer has certain values, 
#thus the output is distorted


#so how can we just zoom?
g3 + coord_cartesian(xlim=c(1, 3))

#rotate 90 degrees
g3 + coord_flip()

#polar coordinates
g3 + coord_polar()



### an ugly heatmap

library(scales)
library(tidyr)
library(reshape2)
library(dplyr)

# economic indicators dataset
head(economics)

#correlation matrix between these specific variables
econCor <- cor(economics[, c(2, 4:6)]) #this is in "y format" 


# todo learn about piping in R %<%  (cmd+shift+ m)
econMelt <- melt(econCor, varnames=c('x', 'y'), value.name='Correlation')

head(econMelt)

econMelt <- econMelt %>%  arrange(Correlation)

head(econMelt)

# set heatmap to h
h <- ggplot(econMelt, aes(x=x, y=y)) + geom_tile(aes(fill=Correlation))

#now style the heatmap

h + scale_fill_gradient2(low=muted('red'), mid='white', high='steelblue',
  guide=guide_colorbar(ticks=FALSE, barheight=10), limits=c(-1, 1)) + 
  theme_minimal() + labs(x=NULL, y=NULL) 




#todo learn about dplyer

