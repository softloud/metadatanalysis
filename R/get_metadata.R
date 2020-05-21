#' Get metadat data
#'
#' @return A table where each row represents a dataset in metadat::
#'
#' @export

get_metadata <- function() {
  dat_metadata <- data(package = "metadat")

  dataset_names <-
    dat_metadata %>%
    purrr::pluck("results") %>%
    as.data.frame() %>%
    purrr::pluck("Item") %>%
    as.character()

    tibble::tibble(
      pkg_name = dataset_names
    ) %>%
    dplyr::mutate(
      # get datasets into a tibble
      raw_dat = purrr::map(pkg_name, function(x){get(x)}),
      # identify class of each dataset
      class = purrr::map(raw_dat, class),
      # get the column names (variables) of data
      # convert to lowercase
      names = purrr::map(raw_dat, function(x){names(x) %>% tolower()}))
}
