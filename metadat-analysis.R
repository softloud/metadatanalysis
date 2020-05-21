# investigate

# what is the distribution of sample sizes?

# what is the distribution of minimum & maximum values?

# what is the distribution of number of studies

# What is the distribution of cohort sizes?

library(metadat)
library(tidyverse)

# get all dataset names
dat_metadata <- data(package = "metadat")

dataset_names <-
  dat_metadata %>%
  pluck("results") %>%
  as.data.frame() %>%
  pluck("Item") %>%
  as.character()

dat <-
  tibble(
  dataset_name = dataset_names
) %>%
  mutate(
    # get datasets into a tibble
    raw_dat = map(dataset_name, function(x){get(x)}),
    # identify class of each dataset
    class = map(raw_dat, class),
    # get the column names (variables) of data
    # convert to lowercase
    names = map(raw_dat, function(x){names(x) %>% tolower()}),
    # filter out phylo class (unclear of how to work with theses data)
    df_flag = "data.frame" %in% class) %>%
    dplyr::filter(df_flag) %>%
    dplyr::select(-df_flag) %>%
  mutate(
    author_flag = map_lgl(names, function(x) {any(c("author", "authors") %in% x)}),
    study_flag = map_lgl(names, function(x) {any(c("study", "studyid","study_id", "reference") %in% x)})
  )

# how many datasets have study/author variables
dat %>%
  dplyr::filter(author_flag | study_flag) %>%
  dim()

# how many total datasets
dat %>% dim()

# identify unique authors
author <-
  dat %>%
  dplyr::filter(author_flag) %>%
  mutate(unique_auth = map_lgl(raw_dat, function(x) {
    length(unique(x$author)) == length(x$author)
  }))

# number of datasets with unique author
author %>% dplyr::filter(unique_auth) %>% dim()

# identify unique studies
study <-
  dat %>%
  dplyr::filter(study_flag) %>%
  mutate(unique_study = map_lgl(raw_dat, function(x) {
    if ("studyId" %in% names(x)) {
      x <- x %>% rename(study = studyId)
    } else if ("study_id" %in% names(x)) {
      x <- x %>% rename(study = study_id)
    }
    length(unique(x$study)) == length(x$study)
  }))

# number of datasets with unique study
study %>% dplyr::filter(unique_study) %>% dim()

# overlap
inner_join(study, author) %>%
  dim()
