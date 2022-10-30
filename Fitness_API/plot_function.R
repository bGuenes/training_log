output <- function(input_file, plot_days){
  
  # read data
  df <- read.csv(text = input_file, sep = ",", header = FALSE)
  colnames(df) <- c("Date", "Time", "Training", "Distance", "Duration", "Excertion")
  
  # sort training for time
  df <- df[order(df$Date),]
  for (i in 1:length(df$Training)){
    if (grepl("Rudern", df$Training[i], fixed = TRUE)) df$Training[i] = " Rudern"
  } 
  
  # format dates to date format
  df$Date <- as.Date(df$Date, "%d.%m.%Y")
  
  # add missing dates
  dates <- seq.Date(min(df$Date), max(df$Date), by = "day")
  for (i in seq_along(dates)) {
    if (sum(df$Date == dates[i]) == 0) {
      add_day <- data.frame("Date" = dates[i], 
                            "Time" = NA, 
                            "Training" = NA,
                            "Distance" = NA,
                            "Duration" = 0,
                            "Excertion" = NA)
      df <- rbind(df, add_day)
    }
  }
  
  # calculate daily training time
  unique_dates = unique(df$Date)
  df_date_trainingTime <- data.frame(Date = unique_dates, daily_duration = 0)
  
  for (i in seq_along(unique(df$Date))) {
    df_date_trainingTime$daily_duration[i] <- sum(df[df$Date==unique_dates[i],]$Duration)  
  }
  
  mask <- df$Date > max(df$Date)-plot_days
  
  df_plot <- df[mask,]
  
  # plot
  p <- ggplot(df_plot[order(df$Training),], aes(fill = Training, x = Date, y = Duration)) + 
    geom_bar(position = "stack", stat='identity') +
    scale_fill_manual(values = magma(5, alpha = 1, begin = 0.4, end = 0.8, direction = 1)) +
    ggtitle(sprintf("Over the last %i days you trained %i minutes",
                    plot_days, sum(df_plot$Duration)))
  
  return(p)
}
