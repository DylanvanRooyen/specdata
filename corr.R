corr <- function(directory, threshold = 0){
  correlations <- numeric(0)
  comp_data <- complete(directory)
  comp_data <- comp_data[comp_data$nobs>=threshold,]
  
  if(nrow(comp_data)>0){
    for(i in comp_data$id){
      names <- paste(getwd(),"/",directory,"/",sprintf("%03d", i),".csv", sep = "")
      all_data <- read.csv(names)
      cut_data <- all_data[(!is.na(all_data$sulfate)),]
      cut_data <- cut_data[(!is.na(cut_data$nitrate)),]
      sulfate_nums <- cut_data["sulfate"]
      nitrate_nums <- cut_data["nitrate"]
      correlations <- c(correlations, cor(sulfate_nums,nitrate_nums))
    }
  }
  correlations
}