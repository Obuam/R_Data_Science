#Adding new variable with mutate()

flights_sml <- select(flights, year:day, ends_with("delay"), distance, air_time)

  mutate(flights_sml, 
       gain = arr_delay - dep_delay,
       speed = distance / air_time * 60
       )
  
##... You can refer to columns you just created:  
  mutate(flights_sml, 
         gain = arr_delay - dep_delay,
         hours = air_time / 60,
         gain_per_hour = gain / hours
        )
  
##... Use transmute() to keep only the new variables:
  transmute(flights,
            gain = arr_delay - dep_delay,
            hours = air_time / 60,
            gain_per_hour = gain / hours
            )
  
##....Useful Creation Functions
  #frequently used functions 
  #1. Arithmetic operators +,-,*,/,^
  #2. Modular arithmetic (%/$ = integer division) and (%% = remainder)

transmute(flights,
          dep_time,
          hour = dep_time %/% 100,
          minute = dep_time %% 100
          )
#logs log(), log2(), log10()
#Offsets lead() and lag() allows you to refer to leading or lagging values

#Logical comparisons <,<=,>,>=,!=

##......Ranking egs. min_rank(), row_number(), dense_rank(), percent_rank(),
##......cume_dist(), ntile()

transmute(flights,
          air_time,
          a_time = arr_time - dep_time 
          )

1:3 + 1:10







