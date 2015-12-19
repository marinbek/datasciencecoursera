corr <- function(directory, threshold = 0) {
  # initialize empty numeric vector
  correlations <- numeric()
  
  # go over all requested measurement files
  for (filename in list.files(directory, pattern="*.csv")) {
    
    full_path <- sprintf("%s/%s", directory, filename)
    data <- read.csv(full_path)
    
    complete_cases <- sum(complete.cases(data))
    if (complete_cases < threshold || complete_cases == 0) {
      next
    }
    
    correlations <- c(correlations, cor(data[,"nitrate"], data[,"sulfate"], use="complete.obs"))
  }

  return(correlations)
}