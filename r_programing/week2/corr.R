corr <- function(directory, threshold = 0) {
  # initialize empty numeric vector
  correlations <- numeric()
  
  # go over all requested measurement files
  for (filename in list.files(directory, pattern="*.csv")) {
    
    # use sprintf to join directory name and file name
    full_path <- sprintf("%s/%s", directory, filename)
    data <- read.csv(full_path)
    
    # get vector of complete cases, skip if there are no complete cases or 
    # if the threshold is not met
    complete_cases <- sum(complete.cases(data))
    if (complete_cases < threshold || complete_cases == 0) {
      next
    }
    
    # calculate correlation using 'cor' and append to result vector
    # "use=complete.obs" means it will skip rows where data is not complete
    correlations <- c(correlations, cor(data[,"nitrate"], data[,"sulfate"], use="complete.obs"))
  }

  return(correlations)
}