complete <- function(directory, id = 1:332) {

  # initialize a dataframe with two columns:
  #   "id" with values of given IDs
  #   "nobs" which is a numeric vector initialized to length of given IDs
  #          numeric(length=X) creates a numeric vector of length X initialized to 0
  df <- data.frame(id=id, nobs=numeric(length(id)))

  # go over all requested measurement files
  for (i in id) {
    
    filename <- sprintf("%s/%03d.csv", directory, i)
    data <- read.csv(filename)
    
    # sum(complete.cases(dataframe)) gives you number of complete rows because
    # summing TRUE and FALSE values counts 1 for TRUE and 0 for FALSE
    
    # we store the sum in dataframe cell on the row id=i and column "nobs"
    df[df$id==i, "nobs"] <- sum(complete.cases(data))
 }
  return(df)
}