library(tidyverse)
ggplot(diamonds, aes(carat, price)) +
  geom_hex()

ggsave("diamonds.jpg")
ggsave("diamonds.pdf")

write.csv(diamonds, "diamonds.csv")

as_tibble(iris)

tibble(
  x = 1:5,
  y = 1,
  z = x ^ 2 + y
)

tibble(
  a = lubridate::now() + runif(1e3) * 86400, b = lubridate::today() + runif(1e3) * 30, c = 1:1e3,
  d = runif(1e3),
  e = sample(letters, 1e3, replace = TRUE)
)

nycflights13::flights %>% 
  print(n = 10, width = Inf)

##Subsetting
##use $,  [[ ]]

df <- tibble(
  x = runif(5),
  y = rnorm(5)
)
df$x
df[[1]]

## special placeholder " . "

df %>% 
  .$y

df %>% 
  .[[1]]
df %>% 
  .[['x']]

class(as.data.frame(tb))

class(mtcars)

df <- data.frame(abc = 1, xyz = "a")
df$x
df[, "xyz"]
df[, c("abc", "xyz")]