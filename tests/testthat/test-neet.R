context("neet")

library(neet)
library(metadat)

test_neet(get_metadata(), "data.frame")
test_neet(get_metadata() %>% pluck("raw_dat", sample(1:64, size = 1)) %>% get_k(), "logical")
