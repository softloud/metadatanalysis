#' Identify if it has a study
#'
#' @inheritParams get_k
#'
#' @return Vector of sample sizes in a [metadat] dataset.
#'
#' @export

get_n <- function(metadatdat) {

  # keys that might signify n

  # extract cols that match

  # take first - should we prompt user if there are more than one?
  # possibly add a variable to function that allows user to specfiy which
  # for this dataset
  # but,for starters, take first, as we did in get_k

  keys <- c("ni", "n1i", "n2im", "n")

  # will deal with phylo later
  if ("phylo" %in%  class(metadatdat)) return("phylo")

  # lowercase names, to make it easier
  dat <- metadatdat %>% janitor::clean_names()

  # if no study variable found
  if (!any(id_flags %in% names(dat))) return("no n id found")



}
