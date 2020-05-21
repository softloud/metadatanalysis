context("studies")

library(metadat)

test_that("data with no study id return no study id", {
  expect_true(get_metadata() %>% pluck("raw_dat", 37) %>% get_k()
              == "no study id")
})
