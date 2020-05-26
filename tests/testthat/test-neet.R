context("neet")

library(neet)
library(metadat)
library(metafor)
library(metadatanalysis)

test_neet(get_metadata(), "data.frame")
test_neet(get_k(dat.bangertdrowns2004), "numint")
test_neet(get_n(dat.bangertdrowns2004), "numint")
test_neet(plot_n(), "ggplot")
test_neet(plot_k(), "ggplot")
