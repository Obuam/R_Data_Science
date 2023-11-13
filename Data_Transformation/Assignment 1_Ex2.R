##........Exercise 2
#Number of flights per carrier
NumFlight <- hflights %>% 
  select(UniqueCarrier, FlightNum) %>% 
  group_by(UniqueCarrier) %>% 
  summarise(sum(FlightNum))

#Total distance
TotDistance <- hflights %>% 
  select(UniqueCarrier, Distance) %>% 
  group_by(UniqueCarrier) %>% 
  summarise(sum(Distance)) %>% 
  arrange(`sum(Distance)`)

#Total actual elapsed time
ActEls_time <- hflights %>% 
  select(UniqueCarrier, ActualElapsedTime) %>% 
  group_by(UniqueCarrier) %>% 
  summarise(Hours = sum(ActualElapsedTime, na.rm = TRUE)/60) %>% 
  arrange(Hours)

#Total air time in hours per carrier
TotAir_time <- hflights %>% 
  select(UniqueCarrier,AirTime) %>% 
  group_by(UniqueCarrier) %>% 
  summarise(Hours = sum(AirTime, na.rm = TRUE) / 60) %>% 
  arrange(Hours)

#Mean distance of flight per carrier
MeanDistance <- hflights %>% 
  select(UniqueCarrier, Distance) %>% 
  group_by(UniqueCarrier) %>% 
  summarise(mean(Distance))

#Mean actual elapsed time
Mean_ActEls_time <- hflights %>% 
  select(UniqueCarrier, ActualElapsedTime) %>% 
  group_by(UniqueCarrier) %>% 
  summarise(Hours = mean(ActualElapsedTime, na.rm = TRUE) /60)

#Mean air time in hours per flight for each carrier
MeanAir_time <- hflights %>% 
  select(UniqueCarrier,AirTime) %>% 
  group_by(UniqueCarrier) %>% 
  summarise(Hours = mean(AirTime, na.rm = TRUE) / 60)

##.........Second
hflights %>% 
  select(UniqueCarrier, Distance) %>% 
  group_by(UniqueCarrier) %>% 
  summarise(Totaldistance = sum(Distance)) %>% 
  mutate(Rank = rank(Totaldistance)) %>% 
  group_by(Rank >= 13) %>% 
  #mutate(Groups = case_when(`Rank >= 13` == TRUE ~ "Top 3", 
                          #  TRUE ~ "Others")) %>% 
  mutate(Groups = ifelse(`Rank >= 13` == TRUE, "Top 3", "Others")) %>% 
  ungroup() %>% 
  group_by(Groups) %>% 
  summarise(Totaldistance = sum(Totaldistance)) %>% 
  mutate(Percentage = (Totaldistance/sum(Totaldistance)) * 100)



##.......Check if there is NA in any variable
#.... any(is.na(variable name))

