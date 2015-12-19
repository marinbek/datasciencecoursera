pollutantmean <- function(directory, pollutant, id = 1:332) {

  # initialize empty vector
  # we'll use this to store all non-NA values from all files for given pollutant 
  all_pollutants <- c()
  
  # go over all requested measurement files
  for (i in id) {
    
    # sprintf formats a string, we need to make a full path
    # in format "DIRECTORY\file.csv" where "file" is a number 001-332 with leading zeros
    # %03d means "decimal number taking 3 character places with leading zeros"
    filename <- sprintf("%s/%03d.csv", directory, i)
    data <- read.csv(filename)
    
    # filter out where requested pollutant is non-NA
    # and extract "pollutant" column into "values" vector
    values <- data[!is.na(data[pollutant]), pollutant]

    # append filtered-out values 
    all_pollutants <- append(all_pollutants, values)
  }
  
  return(mean(all_pollutants))
}