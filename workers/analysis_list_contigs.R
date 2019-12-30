library(dplyr)
library(tidyverse)
library(stringr)

VirSorter_dir="/Users/aponsero/Documents/UA_POSTDOC/projects/Nostoc_project/Lichen_meta/exp2_Viral_search/VirSorter"
VirFinder_dir="/Users/aponsero/Documents/UA_POSTDOC/projects/Nostoc_project/Lichen_meta/exp2_Viral_search/VirFinder_default"
Vibrant_dir="/Users/aponsero/Documents/UA_POSTDOC/projects/Nostoc_project/Lichen_meta/exp2_Viral_search/Vibrant"
out_dir="/Users/aponsero/Documents/UA_POSTDOC/projects/Nostoc_project/Lichen_meta/exp2_Viral_search/selection1"

list_files=c("res_1_S1.csv","res_2_S3.csv","res_3_S4.csv","res_4_S5.csv","res_5_S6.csv",
             "res_6_S7.csv","res_7_S8.csv","res_8_S9.csv","res_9_S10.csv","res_10_S11.csv",
             "res_11_S12.csv","res_12_S13.csv")

for (f in list_files){
  VirS_file<-paste(VirSorter_dir, f, sep = "/", collapse = NULL)
  VirS_data <- readr::read_csv(VirS_file) %>% select(name)
  
  VirF_file<-paste(VirFinder_dir, f, sep = "/", collapse = NULL)
  VirF_data <- readr::read_csv(VirF_file) %>% select(name)
  
  Vib_file<-paste(Vibrant_dir, f, sep = "/", collapse = NULL)
  Vib_data <- readr::read_csv(Vib_file) %>% filter(lytic=="0") %>% select(name)
  
  #merge list of contigs
  join_contig <- full_join(VirS_data, VirF_data, by="name")
  fulljoin_contig <- full_join(join_contig, Vib_data, by="name")

  #export conversion
  con_file<-paste(out_dir, f, sep = "/", collapse = NULL)
  out_file<-str_replace(con_file, "res", "list")
  write.csv(fulljoin_contig, out_file, row.names=FALSE)
}
