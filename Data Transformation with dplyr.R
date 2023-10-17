####........Data Transformation with dplyr
library(flights)
nycflights13::flights
view(flights)
install.packages("nycflights13")
library(nycflights13)

###..........dplyr Basics
##...Filter Rows with filter()
(jan <- filter(flights, month == 1, day == 1))
(Dec25 <- filter(flights, month == 12, day == 25))

##...Comparisons operator: >,>=,<,<=, !=(not equal),and ==(equal)
sqrt(2)^2 == 2
near(sqrt(2)^2, 2)

##...Logical Operators (&=and, |=or, !=not)
filter(flights, month == 11 | month == 12)

(novDec <- filter(flights, month %in% c(11,12)))

filter(flights, !(arr_delay > 120 | dep_delay > 120))
filter(flights, arr_delay <= 120 & dep_delay <= 120)

##Missing Values
NA > 5
#is.na() to find if there are missing values in a dataset 
# explicitly call for NA values if you want to include them in filters 
df <- tibble(x = c(1, NA, 3))
filter(df, x > 1)
filter(df, is.na(x) | x > 1)

##.... Exercise
#1a. Had an arrival delay of two or more hours
filter(flights, arr_delay > 120)

#b. Flew t Houston (IAH or HOU)
filter(flights, dest == "IAH"| dest == "HOU")

#c. Were operated by United, American, or Delta
filter(flights, carrier == c("AA", "DL", "UA"))

#d. Departed in summer (July, August, and September)
 filter(flights, month == 7:9)

#e. Arrived more than two hours late, but didn't leave late
 filter(flights, arr_delay > 120 & dep_delay <= 0)
 
 #f. Were delayed by at least an hour, but made up over 30 minutes
 #.  in flight
 filter(flights, dep_delay > 60 & air_time < 30 )

#g. Departed between midnight and 6 a.m. (inlusive)
filter(flights, dep_time >000 & dep_time <=600)
 
#2. What does between() do?
# can be used to check if a value fall within a range
# can also be used to in filtering 
# between(x, left, right, inclusive = ...)

 filter(flights, between(dep_time, 000, 600))
 
 #3. How many flights have a missing dep_time? 
na.new <- filter(flights, is.na(dep_time))

 view(na.new)


