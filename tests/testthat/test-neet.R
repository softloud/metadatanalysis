context("neet")

library(neet)

test_neet(get_metadata(), "data.frame")
test_neet(get_metadata() %>% unique_authors(), "logical")
test_neet(get_metadata() %>% unique_studies(), "logical")
