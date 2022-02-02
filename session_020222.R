library(tidyverse)

# basics of string concatenation ------------------------------------------

str_c("ben", "ayre")
str_c("ben", NA)
str_c("ben", "NA")
str_c("ben", str_replace_na("ayre"))
str_c("ben", str_replace_na(NA))

# removing white space ----------------------------------------------------

like_that <- "like this"
"   like         this" == like_that
str_trim("    like this") == like_that
str_squish("like         this") == like_that

# the role of delimiters (commas,  semicolons, tabs etc.) -----------------

data <- read_delim("data/socfin.csv", delim = ",")

# add a new comma separated column
data_new_column <- data %>% 
  mutate(my_column = str_c(group, ultimate_parent_country, sep = ",")) %>% 
  select(my_column, everything())

# by default write_csv puts quotes around the column to protect us from ourselves
write_csv(data_new_column, "data/socfin_new_column.csv")
read_csv("data/socfin_new_column.csv")

# but if we're hell bent on destruction we can prevent this
write_csv(data_new_column, "data/socfin_new_column.csv", quote = "none")
read_csv("data/socfin_new_column.csv")

# pattern matching --------------------------------------------------------

str_extract("banana", "na|ba")
str_extract_all("banana", "na|ba")

str_remove("banana", "na|ba")
str_remove_all("banana", "na|ba")

str_replace("banana", "na|ba", "pa")
str_replace("banana", "na|ba$", "pa")

# repetition within patterns ----------------------------------------------

pattern <- "lllllllike this"
str_extract(pattern, "l{7}")
