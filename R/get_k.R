#' Return number of studies in a meta-analysis
#'
#' @param metadatdat A dataset from [metadat].
#'
#' @return Number of studies, k. Or "no study id" if we couldn't find one.
#'
#' @export

get_k <- function(metadatdat) {

  # possible variable names for study id
  study_flags <- c("study", "study_id", "studyid", "reference", "id", "source")
  author_flags <- c("author", "authors")

  # id flag
  id_flags <- c(study_flags, author_flags)

  # will deal with phylo later
  if ("phylo" %in%  class(metadatdat)) return("phylo")

  # lowercase names, to make it easier
  dat <- metadatdat %>% janitor::clean_names()

  # if no study variable found
  if (!any(id_flags %in% names(dat))) return("no study id found")

  # find column that has id in

  # select *first* column that matchs
  # this might bite us in the arse later
  col_id <- which(names(dat) %in% id_flags)[[1]]

  study_id <- metadatdat[,col_id]

  # return number of unique study ids: k
  unique(study_id) %>% length()

}
