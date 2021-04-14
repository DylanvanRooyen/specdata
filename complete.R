complete <- function(directory, id = 1:332){
  
  df <- data.frame(id = numeric(0), nobs = numeric(0))
  
  for(i in id){
    names <- paste(getwd(),"/",directory,"/",sprintf("%03d", i),".csv", sep = "")
    all_data <- read.csv(names)
    cut_data <- all_data[(!is.na(all_data$sulfate)),]
    cut_data <- cut_data[(!is.na(cut_data$nitrate)),]
    rows <- nrow(cut_data)
    df <- rbind(df, data.frame(id = i, nobs = rows))
  }
  
  df
}