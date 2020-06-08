#' Identify if it has a study
#'
#' @inheritParams get_k
#' @param n_var Specify which column which has studies.
#'
#' @return Vector of sample sizes in a [metadat] dataset.
#'
#' @export

get_n <- function(metadatdat, n_var = NULL) {
  if (!is.null(n_var))
    return(metadatdat[n_var] %>% unlist() %>% as.numeric())
  # keys that might signify n

  # extract cols that match
  keys <- c("ni", "n1i", "n2im", "n")

  # will deal with phylo later
  if ("phylo" %in%  class(metadatdat))
    return("phylo")

  # lowercase names, to make it easier
  dat <- metadatdat %>% janitor::clean_names()

  # if no study variable found
  if (!any(keys %in% names(dat)))
    return("no n id found")

  # select *first* column that matchs
  # this might bite us in the arse later
  col_id <- which(names(dat) %in% keys)

  ns <- metadatdat[col_id] # %>% unlist() %>% as.numeric()

  if (ncol(ns) == 1)
    return(ns %>% unlist() %>% as.numeric())
  else if (all(names(ns) == c("ni", "n1i")))
    return(ns %>%
             pluck("ni") %>%
             unlist() %>% as.numeric())

  else
    return(ns)

  # todo: check to see if n1i n2i and n in the same dataset

}
