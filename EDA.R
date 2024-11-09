library(tidyverse)
library(tidyr)

# Load data
base_path <- paste0(Sys.getenv("OneDrive"), "/Data Science Project Idea 31/")
data <- read.csv(paste0(base_path,"combined.csv"))

# Demographics analysis
