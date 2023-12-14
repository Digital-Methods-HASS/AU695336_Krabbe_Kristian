
install.packages("tidyverse")
library(tidyverse)
library(ggplot2)

folketingsvalg <- read_csv("data/folketingsvalg.csv")
ftv_clean <- na.omit(folketingsvalg)


#FIGURE 1 - Visualization of my dataset
ftv_clean %>% 
  ggplot(aes(x = Election_year,y = Procent))+
  geom_line(aes(color = Party))+
  labs(x = "Year", y = "precentage of votes", 
       title = "Figure 1 - Election results 1973-2022" )

ggsave("FIGURE_1.png")

#*Kristeligt Folkeparti changes it's name to Kristendemokraterne in 2003*


#FIGURE 2 - The parties related to 'Jordskredsvalget' in 1973


parties_to_plot <- c("Centrum_Demokraterne", "Fremskridtspartiet", "Kristeligt_Folkeparti", 
                     "Danmarks_Retsforbund", "Danmarks_Kommunistiske_Folkeparti")
custom_colors <- c("Centrum_Demokraterne" = "purple", "Fremskridtspartiet" = "yellow", "Kristeligt_Folkeparti" = "green", 
                   "Danmarks_Retsforbund" = "violet", "Danmarks_Kommunistiske_Folkeparti" = "red")
years_to_include <- c(1973, 1975, 1977, 1979, 1981, 1984)

filtered_data <- ftv_clean %>%
  filter(Party %in% parties_to_plot & Election_year %in% years_to_include)
  

ggplot(filtered_data, aes(x = Election_year,y = Procent)) +
  geom_point(aes(color = Party)) +
  geom_smooth()+
  scale_color_manual(values = custom_colors)+
  labs(title = "Figure 2 - Development of the 'Jordskredsvalget'-parties",
       x = "Election year",
       y = "Precentage of votes")+
  scale_x_continuous(breaks = years_to_include)

ggsave("FIGURE_2.png")


#FIGURE 3 - The four old parties

parties_to_plot2 <- c("Socialdemokratiet", "Venstre", "Det_Radikale_Venstre", "Det_Konservative_Folkeparti")
custom_colors <- c("Socialdemokratiet" = "red", "Venstre" = "blue", "Det_Radikale_Venstre" = "purple", "Det_Konservative_Folkeparti" = "green")

filtered_data <- ftv_clean %>% filter(Party %in% parties_to_plot2)

ggplot(filtered_data, aes(x = Election_year, y = Procent)) +
  geom_line(aes(color = Party)) +
  scale_color_manual(values = custom_colors)+
  labs(title = "Figure 3 - Development of the four old parties",
       x = "Year",
       y = "Precentage of votes")

ggsave("FIGURE_3.png")

#FIGURE 4 - Comparison of the average voting percentage for the right-wing and left-wing

left_wing <- ftv_clean %>% 
  filter(Party == "Socialdemokratiet" | Party == "Socialistisk_Folkeparti" | Party == "Endhedslisten" |
           Party == "Alternativet" | Party == "Danmarks_Kommunistiske_Folkeparti" | 
           Party == "Fælles_Kurs" | Party == "Venstresocialisterne")

ggplot(data = left_wing)+
  geom_jitter(aes(x = Election_year, y = Procent, color = Party))+
  geom_smooth(aes(x = Election_year, y = Procent))

right_wing <- ftv_clean %>% 
  filter(Party == "Venstre" | Party == "Det_Konservative_Folkeparti" | Party == "Centrum_Demokratern" | 
           Party == "Fremskridtspartiet" | Party == "Kristeligt_Folkeparti" | Party == "Danmarks_Retsforbund" | 
           Party == "Dansk_Folkepart" | Party == "Liberal_Alliance" | Party == "Moderaterne" | 
           Party == "Nye_Borgerlige" | Party == "Danmarksdemokraterne")

ggplot(data = right_wing)+
  geom_jitter(aes(x = Election_year, y = Procent, color = Party))+
  geom_smooth(aes(x = Election_year, y = Procent))

ggplot()+
  geom_smooth(data = left_wing, aes(x = left_wing$Election_year, y = left_wing$Procent, color = "left_wing"))+
  geom_smooth(data = right_wing, aes(x = right_wing$Election_year, y = right_wing$Procent, color = "right_wing"))+
  labs(x = "Year", y = "Precentage of votes", title = "Figure 4 - Development of left- and right-wing parties")

ggsave("FIGURE_4.png")  
