# Inputting Data from .csv

library(readr)
wfhs <- read_csv("wfhs.csv")
wfhs["WM_JSTR2"]