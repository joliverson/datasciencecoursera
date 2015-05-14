setwd("~/scratch/dsc/datasciencecoursera/")

pollutantmean <- function(directory, pollutant, id=1:332) {
  if(grep("specdata", directory) == 1) {
    directory <- ("./specdata/")
  }
  get_mean <- NULL
  files <- as.character(list.files(directory))
  file_paths <- paste(directory, files, sep="")
  for (i in id){
    current_file <- read.csv(file_paths[i], header=T, sep=",")
    pollutant
    na_free <- current_file[!is.na(current_file[,pollutant]), pollutant]
    get_mean <- c(get_mean, na_free)
  }
  result <- mean(get_mean)
  return(result)
}



##Tests
source("pollutantmean.R")
pollutantmean("specdata", "sulfate", 1:10) #4.064128
pollutantmean("specdata", "nitrate", 70:72) #1.706047
pollutantmean("specdata", "nitrate", 23) #1.280833
