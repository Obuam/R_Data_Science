##ggplot2
head(mpg)
###......Aesthetic
ggplot(mpg) + geom_point(aes(x= displ, y= hwy, color = class))
ggplot(mpg) + geom_point(aes(x= displ, y= hwy, size = class))
ggplot(mpg) + geom_point(aes(x= displ, y= hwy, alpha = class))
ggplot(mpg) + geom_point(aes(x= displ, y= hwy, shape = class))

###.......Facets...facet_wrap() to facet a single variable and should be discret
ggplot(mpg) + geom_point(aes(x=displ, y=hwy)) + facet_wrap(~ class, nrow = 2)

###....facet_grid() to facet multiple variables written as facet_grid(a~b)

ggplot(mpg) + geom_point(aes(x=displ, y=hwy)) + facet_grid(.~cyl)

###....Geometric Objects geom function
ggplot(mpg) + geom_point(aes(x=displ, y= hwy))

ggplot(mpg) + geom_smooth(aes(x= displ, y = hwy))

ggplot(mpg) + geom_smooth(aes(x=displ, y= hwy, linetype = drv))

ggplot(mpg) + geom_smooth(aes(x=displ, y= hwy, colour = drv))

ggplot(mpg) + 
  geom_point(aes(x=displ, y= hwy)) +
  geom_smooth(aes(x= displ, y = hwy))

## Mapping different aesthetics in the same code
ggplot(mpg, aes(x=displ, y= hwy)) + 
    geom_point(aes(color = class)) +
    geom_smooth()

## You can specify different data for each layer
ggplot(mpg, aes(x=displ, y= hwy)) + 
  geom_point(aes(color = class)) +
  geom_smooth(data = filter(mpg, class == "subcompact"), se = FALSE)

ggplot(mpg, aes(x=displ, y= hwy, color = drv)) + 
  geom_point( ) +
  geom_smooth(se = FALSE)

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point() +
  geom_smooth()


ggplot() +
  geom_point(
    data = mpg,
    mapping = aes(x = displ, y = hwy, color = drv) )+
  geom_smooth(
    data = mpg,
    mapping = aes(x = displ, y = hwy)
  )

###.......Statistical Transformations
##.....BarCharts
ggplot(diamonds, aes(x=cut)) +
  stat_count()
##....forcing ggplot to use the numbers in the data to plot the y-axis
demo <- tribble(
  ~a,       ~b,
  "bar_1", 20,
  "bar_2", 30,
  "bar_3", 40
)
ggplot(demo, aes(x=a, y=b)) +
  geom_bar(stat = "identity")

##.....Displaying a bar chart of proportions 
ggplot(diamonds, aes(x = cut, y = ..prop.., group = 1)) +
  stat_count()









