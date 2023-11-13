###........EXPLORATORY DATA ANALYSIS
#... Packages.... tidyverse
# Two useful questions to ask during EDA
#1. What type of variation occurs within my variables?
#2. What type of covariation occurs between my variables?

#Exploring categorical variables with bar_chat
ggplot(diamonds, aes(x = cut)) +
  geom_bar(color = "red", fill = "gray")

#Counting with the number of observations 
  diamonds %>% 
  count(cut)

  #Exploring continuous variables with histogram
  ggplot(diamonds, aes(x= carat)) +
    geom_histogram(binwidth = 0.5, fill = "green", color = "black")
  
  diamonds %>% 
    count(cut_width(carat, 0.5))
  
  smaller <- diamonds %>% 
    filter(carat < 3)
  
ggplot(smaller, aes(x = carat)) +
  geom_histogram(binwidth = 0.1, fill = "green", color = "black")
  
#use geom_freqpoly() to overlay multiple histograms in the same plot

ggplot(smaller, aes(x = carat, color = cut)) +
  geom_freqpoly(binwidth = 0.1)

#Typical Values

ggplot(smaller, aes(x = carat)) +
  geom_histogram(binwidth = 0.01)

ggplot(faithful, aes(x = eruptions)) +
  geom_histogram(binwidth = 0.25)

#Unusual Values
#example; outliers
ggplot(diamonds, aes(x = y)) +
  geom_histogram(binwidth = 0.5)

ggplot(diamonds, aes(x = y)) +
  geom_histogram(binwidth = 0.5) +
  coord_cartesian(ylim = c(0, 50))

unusual <- diamonds %>% 
  filter(y < 3 | y > 20) %>% 
  arrange(y)

diamonds2 <- diamonds %>% 
  mutate(y = ifelse(y < 3 | y > 20, NA, y))
# ifelse(test, yes, no)

ggplot(diamonds2, aes(x = x, y = y)) +
  geom_point(na.rm = TRUE)

see <- flights %>% 
  mutate(
    cancelled = is.na(dep_time),
    sched_hour = sched_dep_time %/% 100,
    sched_min = sched_arr_time %% 100,
    sched_dep_time = sched_hour + sched_min / 60 
  ) %>% 
  ggplot(aes(sched_dep_time)) +
  geom_freqpoly(aes(colour = cancelled), binwidth = 1/4)


## Categorical and Continuous Variables

ggplot(diamonds, aes(x = price)) +
  geom_freqpoly(aes(color = cut), binwidth = 500)

ggplot(diamonds) + 
  geom_bar(aes(x = cut))

ggplot(diamonds, aes(x = cut, y = price)) + geom_boxplot()

install.packages("hexbin") 

library(lvplot)

ggplot(diamonds) +
  geom_count(aes(x =cut, y = color))

#diamonds %>% 
 # count(color, cut) %>% 
  #ggplot(aes(x = color, y = cut)) +
  #geom_tile(aes(fill = n)
            
 library(methods)           
ggplot(diamonds) +
  geom_point(aes(x = carat, y = price), alpha = 1/100)

ggplot(smaller) + 
geom_bin2d(aes(x = carat, y = price))

ggplot(faithful) +
  geom_point(aes(x = eruptions, y = waiting))

library(modelr)
mod <- lm(log(price) ~ log(carat), data = diamonds)

diamonds2 <- diamonds %>% 
  add_residuals(mod) %>% 
  mutate(resid = exp(resid))

ggplot(diamonds2) +
  geom_point(aes(x= carat, y = resid))

ggplot(diamonds2) + 
  geom_boxplot(aes(x = cut, y = resid))

ggplot(faithful, aes(eruptions)) +
  geom_freqpoly(binwidth = 0.25)


diamonds %>%
  count(cut, clarity) %>%
  ggplot(aes(clarity, cut, fill = n)) +
  geom_tile()








  