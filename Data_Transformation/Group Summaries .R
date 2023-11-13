###.........Group Summaries with summarise()
# summarise() collapses a data frame to a single row

summarise(flights, delay = mean(dep_delay, na.rm = TRUE))

# summarise is useful when used with group_by()
by_day <- group_by(flights, year, month, day)
summarise(by_day, delay = mean(dep_delay, na.rm = TRUE))

##...Combining Multiple Operations with the Pipe
delays <- flights %>% 
  group_by(dest) %>% 
  summarise( 
    count = n(),
    dist = mean(distance, na.rm = TRUE),
    delay = mean(arr_delay, na.rm = TRUE)       
    ) %>% 
  filter(count > 20, dest != "HNL")

by_dest <- group_by(flights, dest)
delay <- summarise(by_dest, count = n(),
                   dist = mean(distance, na.rm = TRUE),
                  delay = mean(arr_delay, na.rm = TRUE))
filter(delay, dest == "BHM")


##.....Missing Values........
flights %>%
  group_by(year, month, day) %>%
  summarize(mean = mean(dep_delay))

##...Removing missing values
flights %>%
  group_by(year, month, day) %>%
  summarize(mean = mean(dep_delay, na.rm = TRUE))


not_cancelled <- flights %>% 
  filter(!is.na(dep_delay), !is.na(arr_delay))

not_cancelled %>% 
  group_by(year,month,day) %>% 
  summarise(mean = mean(dep_delay))


##....Counts
# a count of nonmissing values = sum(!is.na(x))

delays <- not_cancelled %>% 
  group_by(tailnum) %>% 
  summarise(
    delay = mean(arr_delay)
  )
ggplot(data = delays, mapping = aes(x= delay)) +
  geom_freqpoly(binwidth = 10)

# scatterplot of number of flights versus average delay
delays <- not_cancelled %>% 
  group_by(tailnum) %>% 
  summarise(
    delay = mean(arr_delay, na.rm = TRUE), 
    n = n()
  ) %>% 
  ggplot() +
  geom_point(aes(x=n, y=delay), alpha = 1/10)

#Filtering to remove extreme data
delays %>% 
  filter(n > 25) %>% 
  ggplot(aes(x = n, y = delay)) +
  geom_point(alpha = 1/10)

## Convert to a tibble so it prints nicely
batting <- as_tibble(Lahman::Batting)

batters <- batting %>% 
  group_by(playerID) %>% 
  summarise(
    ba = sum(H, na.rm = TRUE) / sum(AB, na.rm = TRUE),
    ab = sum(AB, na.rm = TRUE)
  )
batters %>% 
  filter(ab > 100) %>% 
  ggplot(aes(x = ab, y = ba)) +
  geom_point() +
  geom_smooth(method = "gam", se = FALSE)

##.......Useful Summary Functions
# examples are, mean(), median(), count...n(), [] = subsetting

not_cancelled %>% 
  group_by(year, month, day) %>% 
  summarise(
    #average delay:
    avg_delay1 = mean(arr_delay),
    #average positive delay:
    avg_delay2 = mean(arr_delay[arr_delay > 0])
    
  )
## Measures of spread sd(x), IQR(x), mad(x) = median absolute deviation

not_cancelled %>% 
  group_by(dest) %>% 
  summarise(distance_sd = sd(distance)) %>% 
  arrange(desc(distance_sd)) 

## Measures of rank min(x), quantile(x, 0.25), max(x)

# When do the first and last flights leave each day?
not_cancelled %>% 
  group_by(year, month, day) %>% 
  summarise(
    first = min(dep_time),
    last = max(dep_time)
  )
## Measure of position first(), nth(x, 2), last(x)
# Finding the first and last positions
not_cancelled %>% 
  group_by(year, month, day) %>% 
  summarise(
    first_dep = first(dep_time),
    last_dep = last(dep_time)
  )

# To count the number of distinct values = n_distinct(x)
# count the number of non-missing values = sum(!is.na(x))

not_cancelled %>% 
  group_by(dest) %>% 
  summarise(carriers = n_distinct(carrier)) %>% 
  arrange(desc(carriers))
not_cancelled %>% 
  count(dest)

not_cancelled %>% 
  count(tailnum, wt = distance)

not_cancelled %>% 
  group_by(year, month, day) %>% 
  summarise(n_early = sum(dep_time < 500))

not_cancelled %>% 
  group_by(year, month, day) %>% 
  summarise(hour_perc = mean(arr_delay > 60))

###.......Grouping by Multiple Variables
daily <- group_by(flights, year, month, day)
(per_day <- summarise(daily, flights = n()))

##....Ungrouping 
daily %>% 
  ungroup() %>% 
  summarise(flights = n())


#....Grouped Mutates(and Filters)
#Find the worst members of each group:
flights_sml %>% 
  group_by(year, month, day) %>% 
  filter(rank(desc(arr_delay)) < 10)

#Find all groups bigger than a threshold: 
popular_dests <- flights %>% 
  group_by(dest) %>% 
  filter(n() > 365)

#Standardise to compute per group metrics:
popular_dests %>% 
  filter(arr_delay > 0) %>% 
  mutate(prop_delay = arr_delay/ sum(arr_delay)) %>% 
  select(year:day, dest, arr_delay, prop_delay)

  
##.......EXERCISE 1



##.......EXERCISE 2






