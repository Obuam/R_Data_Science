##......Exercise 1
dimensions <- dim(hflights)
num_rows <- dimensions[1]
num_cols <- dimensions[2]
hflights %>% 
  nrow()
hflights %>% 
  ncol()
hflights
##.... Number of rows = 227496
##.... Number of columns = 21

CarrierNames <- unique(hflights$UniqueCarrier)
length(CarrierNames)
##15

##  air_ports
#Origin airport
unique(hflights$Origin)
unique(hflights$Dest)

Or_ports <- length(unique(hflights$Origin))
#Dest_ports
Des_ports <- length(unique(hflights$Dest))
#Total airports involved 
Tot_Invl <- Or_ports + Des_ports
print(Tot_Invl)
##118

hflights %>% 
  select(Origin, Dest) %>% 
  distinct()

##Cancelled flights
Can_f <- filter(hflights, Cancelled == 1)
length(Can_f$Cancelled)
#2973



