#
# This is a Plumber API. You can run the API by clicking
# the 'Run API' button above.
#
# Find out more about building APIs with Plumber here:
#
#    https://www.rplumber.io/
#

# librarys
library(ggplot2)
library(viridis)
library(tidyr)
library(plumber)
library(anytime)
library(viridisLite)

source("plot_function.R")


#* @apiTitle Training Log
#* @apiDescription


#* Plot a histogram
#* @serializer png list(width = 1920, height = 1080, res = 144)
#* @param f:file A file
#* @param days:int
#* @post /upload
upload <- function(f, days) {
  contents <- f[[1]]
  p <- output(contents, as.integer(days))
  plot(p)
}
