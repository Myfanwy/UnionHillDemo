#-------------------------------------------------------#
# M. Johnston - Feb 2019
# Union Hill Code Demo

library(tidyverse)
library(lubridate)

#-------------------------------------------------------#
d <- readxl::read_excel("data/JohnstonClasses.xlsx", sheet = 2, na = "") %>% 
  select(Math, Gender, Height_in, Bday)

# mean

# median

# standard deviation


# plot distribution
# d %>% 
#   filter(Height_in < 100) %>% 
#   group_by(Gender) %>% 
#   mutate(mean_height = mean(Height_in, na.rm = TRUE)) %>% 
#   ggplot() +
#   geom_density(aes(x= Height_in)) +
#   facet_wrap(~Gender) +
#   geom_vline(aes(xintercept = mean_height, lty = Gender))

#-------------------------------------------------------#

# Count data

d$month = month(d$Bday, label = TRUE)

d %>% 
  group_by(Gender, month) %>% 
  tally() %>% 
  arrange(month) %>% 
  ggplot() +
  geom_bar(aes(x = factor(month), y = n), stat = "identity") +
  facet_wrap(~Gender)
