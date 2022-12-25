FROM rstudio/plumber

RUN R -e "install.packages(c('ggplot2','viridis','tidyr', 'viridisLite'))"

CMD ["/app/plumber.R"]
