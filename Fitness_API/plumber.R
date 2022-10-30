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

source("test/apiTest.R")


#* @apiTitle Training Log
#* @apiDescription 


#* Plot a histogram
#* @serializer png
#* @post /plot
function(file, plot_days) {
  output(file, plot_days)
}


