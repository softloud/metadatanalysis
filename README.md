
<!-- README.md is generated from README.Rmd. Please edit that file -->

Questions about the data contained in `metadat::`

1.  What is the distribution of sample sizes n, for each study?
2.  What is the distribution of minimum n and maximum n sample sizes?
3.  What is the distribution of k, number of studies?

<!-- end list -->

``` r
# load packages
library(metadat)
library(tidyverse)
library(metadatanalysis)
```

``` r
# get all the datasets
mdat <- 
  get_metadata()

mdat %>% head()
#> # A tibble: 6 x 4
#>   pkg_name              raw_dat                 class     names     
#>   <chr>                 <list>                  <list>    <list>    
#> 1 dat.bangertdrowns2004 <escalc[,16] [48 × 16]> <chr [2]> <chr [16]>
#> 2 dat.barone2019        <df[,22] [56 × 22]>     <chr [1]> <chr [22]>
#> 3 dat.begg1989          <escalc[,6] [20 × 6]>   <chr [2]> <chr [6]> 
#> 4 dat.berkey1998        <escalc[,9] [10 × 9]>   <chr [2]> <chr [9]> 
#> 5 dat.besson2016        <df[,67] [473 × 67]>    <chr [1]> <chr [67]>
#> 6 dat.bonett2010        <df[,6] [9 × 6]>        <chr [1]> <chr [6]>
```
