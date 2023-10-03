
library(tidyverse)
read_csv("data/Dansk kongerække - Ark1.csv")

Kongerækken <- read_csv("data/Dansk kongerække - Ark1.csv")

Kongerækken <- Kongerækken %>%
  mutate(Regeringstid = Regeringslut - Regeringsstart)

colnames(Kongerækken)

Kongerækken %>% 
  ggplot(aes(x = Regeringsstart, y = Regeringstid))+
  geom_point()+
  geom_smooth()+
  geom_line()+
  labs(x = "Tid",
       y = "Regeringstid")


