FROM rstudio/plumber

RUN R -e "install.packages(c('ggplot2','viridis','tidyr'))"

CMD ["/app/plumber.R"]
