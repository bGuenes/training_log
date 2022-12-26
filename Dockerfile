FROM rstudio/plumber

RUN R -e "install.packages(c('ggplot2','viridis','tidyr', 'viridisLite', 'anytime'))"

CMD ["/app/plumber.R"]
