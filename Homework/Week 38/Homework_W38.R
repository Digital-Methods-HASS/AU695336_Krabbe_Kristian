# Opgave 1) Use R to figure out how many elements in the vector below are greater than 2.
rooms <- c(1, 5, 2, 1, 3, 1, NA, 3, 1, 3, 2, 1, NA, 1, 8, 3, 1, 4, NA, 1, 3, 1, 2, 1, 7, 1, NA)

length(which(rooms>2))
# der er altså 9 elementer som er større end 2.

# Opgave 2) Which function tells you the type of data the 'rooms' vector above contains?
class(rooms)

# Ovenstående funktion fortæller at 'the type of data' for datasættet er 'numeric'

# Opgave 3) What is the result of running the median() function on the above 'rooms' vector?
# jeg bruger nedstående funktion til at fjerne 'NA-elementerne' fra datasættet
rooms[complete.cases(rooms)]

# Herefter finder jeg medianen på datasættet uden 'NA'
median(rooms[complete.cases(rooms)])

# Medianen af datasættet uden 'NA' er altså 2

# Opgave 4)
install.packages("tidyverse")
library(tidyverse)
download.file(
  "https://raw.githubusercontent.com/datacarpentry/r-socialsci/main/episodes/data/SAFI_clean.csv",
  "data/SAFI_clean.csv", mode = "wb"
)
read_csv("data/SAFI_clean.csv")
interviews <- read_csv("data/SAFI_clean.csv", na = c("NULL"))
