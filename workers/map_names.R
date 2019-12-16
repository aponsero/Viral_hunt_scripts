#!/usr/bin/env Rscript
args<-commandArgs(TRUE)

direct <- args[1]
map_files <- args[2]

library(dplyr)
library(tidyverse)
library(stringr)

list.files(direct)
reports <- sort(list.files(path, pattern="_marvel.txt", full.names = TRUE))

for (f in reports){
#Load Marvel hits list
    marvel <- readr::read_csv(f, col_names = c("pos"), col_types = c(n))
#Load conversion table
    con_name<-str_sub(f, start = 1, end = -11)
    con_file<-paste(con_name, "csv", sep = ".", collapse = NULL)
    convert <- readr::read_csv(con_file)

#join tables
    data <- inner_join(marvel,convert,by="pos")
#export conversion
    out_file<-paster("res_", con_file, sep = ".", collapse = NULL)
    write.csv(data,"res_S13.csv")

}

