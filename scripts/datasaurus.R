library(datasauRus)
library(tidyverse)
library(lubridate)
library(padr)

#-------------------------------------------------------#
# simulate data

alldays <- seq.Date(from = as.Date("1985-01-01"), to = as.Date("1985-12-31"), length.out = 365)
bdays <- sample(alldays, 30, replace = TRUE)
d <- data.frame(date = alldays, stringsAsFactors = FALSE)
d$bday = NA
d$bday[d$date %in% bdays == TRUE] <- 1

d <- d %>% 
  group_by(date) %>% 
  mutate(npeople = sum(bday, na.rm = TRUE)) %>% 
  ungroup()

d %>% 
  ggplot(aes(x = npeople)) +
  geom_histogram(size = 2, alpha = 0.8)



str(datasaurus_dozen)

datasaurus_dozen %>% 
  group_by(dataset) %>% 
  summarize(
    mean_x    = mean(x),
    mean_y    = mean(y),
    std_dev_x = sd(x),
    std_dev_y = sd(y),
    corr_x_y  = cor(x, y)
  )

d <- datasaurus_dozen


ggplot(datasaurus_dozen, aes(x=x, y=y, colour=dataset))+
  geom_point()+
  theme_void()+
  theme(legend.position = "none")+
  facet_wrap(~dataset, ncol=3)


