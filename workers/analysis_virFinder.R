args<-commandArgs(TRUE)

direct <- args[1]
datasets_files <- args[2]
min_score <- as.numeric(args[3])
min_length <- as.numeric(args[4])

library(dplyr)
library(tidyverse)
library(stringr)

list.files(direct)
reports <- sort(list.files(direct, pattern="fa.txt", full.names = TRUE))

for (f in reports){
  curr_data <- readr::read_tsv(f, col_names = c("nb", "name", "length","score", "pvalue"), skip = 1)
  data <- curr_data %>% filter(score>=min_score & length>=min_length)
  
  #export conversion
  con_name<-str_sub(f, start = 1, end = -14)
  con_file<-paste(con_name, "csv", sep = ".", collapse = NULL)
  out_file<-str_replace(con_file, "megahit", "res")
  print(out_file)
  write.csv(data, out_file, row.names=FALSE)
}



