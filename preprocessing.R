library(tidyverse)
library(tidyr)

# Load data
base_path <- paste0(Sys.getenv("OneDrive"), "/Data Science Project Idea 31/")
demographics <- read.csv(paste0(base_path, "demographics.csv"))
air_quality <- read.csv(paste0(base_path, "airquality.csv"))
geography <- read.csv(paste0(base_path, "geography.csv"))

# Combining data into a single dataset
air_quality_processed <- air_quality %>%
  pivot_longer(colnames(air_quality)[2:11], names_to = "ID", values_to = "air_quality") %>%
  mutate(ID = sapply(strsplit(ID, split = "_"), '[', 2)) %>%
  mutate(ID = as.integer(ID))

data <- demographics %>%
  inner_join(geography, by = "ID") %>%
  inner_join(air_quality_processed, by = "ID") %>%
  drop_na("air_quality") %>%
  select(-unknown)

# saving data as a CSV
write.csv(data, file=paste0(base_path,"combined.csv"), row.names=FALSE)