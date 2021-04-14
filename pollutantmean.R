pollutantmean <- function(directory, pollutant, id = 1:332){
  average <- c()
  
  for(i in id){
    names <- paste(getwd(),"/",directory,"/",sprintf("%03d", i),".csv", sep = "")
    pol_data <- read.csv(names)
    wanted_data <- pol_data[pollutant]
    average <- c(average, wanted_data[!is.na(wanted_data)])
  }
  
  mean(average)
}