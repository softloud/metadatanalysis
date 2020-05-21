#' Identify if it has a study
#'
#' @return Number of studies, k. Or "no study id" if we couldn't find one.
#'
#' @export

get_k <- function(raw_dat) {

  # possible variable names for study id
  study_flags <- c("study", "study_id", "studyid", "reference", "id", "source")
  author_flags <- c("author", "authors")

  # id flag
  id_flags <- c(study_flags, author_flags)

  # will deal with phylo separately
  if ("phylo" %in%  class(raw_dat)) return("phylo")

  # lowercase names, to make it easier
  dat <- raw_dat %>% janitor::clean_names()

  # if no study variable found
  if (!any(id_flags %in% names(dat))) return("no study id")

  # find column that has id in

  # select *first* column that matchs
  # this might bite us in the arse later
  col_id <- which(names(dat) %in% id_flags)[[1]]

  study_id <- raw_dat[,col_id]

  # return number of unique study ids: k
  unique(study_id) %>% length()

}
