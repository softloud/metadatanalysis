# requires metadat:: package to be installed
library(tidyverse)
library(metadat)

conflicted::conflict_prefer("filter", "dplyr")

rawdat <-
  readRDS(paste0(.libPaths()[1], "/metadat/Meta/Rd.rds"))

meta_of_dat <-
  rawdat %>%
  select(c(Name, Title, Concepts)) %>%
  mutate(Medicine = str_detect(Concepts, "medicine")) %>%
  mutate(Education = str_detect(Concepts, "eductaion")) %>%
  mutate(Psychology = str_detect(Concepts, "psychology")) %>%
  mutate(Infants = str_detect(Concepts, "infants")) %>%
  mutate(Oncology = str_detect(Concepts, "oncology")) %>%
  mutate(Dentistry = str_detect(Concepts, "densitry")) %>%
  mutate(Ecology = str_detect(Concepts, "ecology")) %>%
  mutate(Evolution = str_detect(Concepts, "evolution")) %>%
  mutate(Psychiatry = str_detect(Concepts, "psychiatry")) %>%
  mutate(Phylogeny = str_detect(Concepts, "phylogeny")) %>%
  mutate(Sociology = str_detect(Concepts, "sociology")) %>%
  mutate(Plant = str_detect(Concepts, "plant")) %>%
  mutate(Cardiology = str_detect(Concepts, "cardiology")) %>%
  dplyr::select(-Title, -Concepts) %>%
  gather(key = key, value = value, -Name) %>%
  filter(value == TRUE) %>%
  mutate(dat_name = Name) %>%
  add_count(key)

usethis::use_data(meta_of_dat, overwrite = TRUE)
