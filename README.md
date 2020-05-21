
<!-- README.md is generated from README.Rmd. Please edit that file -->

``` r
# load packages
library(metadat)
library(tidyverse)
library(metadatanalysis)
```

Questions to answer about the data contained in `metadat::`

1.  What is the distribution of sample sizes n, for each study?
2.  What is the distribution of minimum n and maximum n sample sizes?
3.  What is the distribution of k, number of studies?

## distribution of k

``` r
md <- get_metadata()

# distribution of k, number of studies
plotdat <- md %>% 
  dplyr::filter(class != "phylo") %>% 
  mutate(k = map(raw_dat, get_k), 
         row_n = map_int(raw_dat, nrow)) %>% 
  dplyr::filter(k != "no study id") %>% 
  mutate(k = as.integer(k))  

# plot k
  plotdat %>% 
    ggplot(aes(x = k)) +
  geom_density() +
  labs(title =  
  stringr::str_wrap("Distribution of number of studies in datasets in 
       metadat::", 80),
       caption = paste(nrow(plotdat), "out of", nrow(md), "datasets."))
```

<img src="man/figures/README-unnamed-chunk-3-1.png" width="100%" />
