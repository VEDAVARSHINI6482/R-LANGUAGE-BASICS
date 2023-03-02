#IMPORTING LIBRARIES
library(rvest)
library(dplyr)

#SCRAPPING WEBSITE
link <- 'https://www.imdb.com/india/top-rated-tamil-movies/'
  
#Allowability
path = paths_allowed(link)

#HTML ELEMENTS FROM WEBSITE
web <- read_html (link)

#SEGREGATING NAMES
name <- web %>% html_nodes(".titleColumn a") %>% html_text()

#VIEWING NAME LIST
View(name)

#SEGREGATING YEARS
year <- web %>% html_nodes(".secondaryInfo") %>% html_text()

#VIEW YEAR LIST
view(year)

#SEGREGATING RATINGS 
rating <- web %>% html_nodes("strong") %>% html_text()

#CREATING DATAFRAME
imdb.ratings <- data.frame(name, year, rating)

#VIEW DATAFRAME
view(imdb.ratings)

#SAVING DATA
write.csv(imdb.ratings,"My movie data.csv")
