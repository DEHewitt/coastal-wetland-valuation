library(tidyverse)
library(janitor)

#----- load data -----#
sources <- read_csv("data_raw/sources.csv")
consumers <- read_csv("data_raw/HR aggregated data.csv")
#---------------------#

#----- reformat -----#
sources <- sources %>% clean_names()
consumers <- consumers %>% clean_names()
#--------------------#

#----- keep only consumers -----#
consumers <- consumers %>% filter(type == "Consumer")
#-------------------------------#

#----- remove columns -----#
sources <- sources %>% select(sample, site_code, site_name, common_name, species_name, d13c, d15n)
consumers <- consumers %>% select(sample, site_code, site_name, common_name, species_name, d13c, d15n)
#--------------------------#

#----- save -----#
write_csv(sources, file = "data_processed/sources.csv")
write_csv(consumers, file = "data_processed/consumers.csv")
#----------------#
