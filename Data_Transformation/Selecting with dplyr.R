###...............Selecting variable with dplyr 
select(flights, year, month, day)

#Selecting all columns between a specific variables
select(flights, year:day)

#Select all columns except some specific variables
select(flights, -(year:day))

##.....Other helper functions
starts_with() # matches names that begins with "abc"
ends_with() # matches names that end with "xyz"
contains() # matches names that contain "ijk"
num_range("x", 1:3) # matches x1, x2, and x3
matches("") # selecet variables that match a regular expression

##.......

##..............Renaming variables
rename(flights, tail_num = tailnum)
## Using select() in conjunction with the everything() function

select(flights, time_hour, air_time, everything())

##1. Different ways of selecting variables
select(flights, starts_with("dep"), starts_with("arr"))
select(flights, dep_time:arr_delay, -sched_arr_time, -sched_dep_time)

##2. What happens if you include the name of a variable multiple times in a 
#     select() call?
##.. It will be ignored

select(flights, dep_time, arr_delay, arr_delay, dep_time)

##3. What does the one_of() function do? Why might it be helpful in conjunction 
#     with this vector?
# It will select from the data any variable names found in the vector
vars <- c(
  "year", "month", "day", "dep_delay", "arr_delay"
)
select(flights, any_of(vars))

##4.  How do the select helpers deal with case by default? 
##.   How can you change that default?
#......The select helper is case sensitive; to change this you can funtions like 
#...... contain(), matches() with (?i) all in quotation marks
select(flights, contains("TIME"))






