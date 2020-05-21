#' Identify if it has a study
#'
#' @return Number of studies, k. Or "no study id" if we couldn't find one.
#'
#' @export

get_k <- function(raw_dat) {

  # possible variable names for study id
  study_flags <- c("study", "study_id", "studyid", "ref", "reference", "id")
  author_flags <- c("author", "authors")
  year_flag <- c("year", "date")

  # id flag
  id_flags <- c(study_flags, author_flags, year_flag)

  # will deal with phylo separately
  if (class(raw_dat) == "phylo") return("phylo")

  # lowercase names, to make it easier
  names(raw_dat) <- names(raw_dat) %>% janitor::clean_names()

  # if no study variable found
  if (!any(flags %in% names(raw_dat))) return("no study id")

  # find column that has id in

    # get studies as a vector
  study_id <- raw_dat %>% purrr::pluck(id_col)


}
