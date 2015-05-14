#!/usr/bin/Rscript --default-packages=methods,utils,stats
#Jody Oliverson May 14, 2015 at 9:55 AM MDT



complete <- function(directory, id=1:332) {
  if(grep("specdata", directory) == 1) {
    directory <- ("./specdata/")
  }
  id_length <- length(id)
  complete_data <- rep(0,id_length)
  files <- as.character(list.files(directory))
  file_paths <- paste(directory, files, sep="")
  j <- 1
  for (i in id) {
    current_file <- read.csv(file_paths[i], header=T, sep=",")
    complete_data[j] <- sum(complete.cases(current_file))
    j <- j+1
  }
  result <- data.frame(id=id, nobs = complete_data)
  return(result)
}



#source("complete.R")
##Test Cases
#complete("specdata", 1)
##
#id nobs
#1  1  117
##
#complete("specdata", c(2,4,8,10,12))
##
#  id nobs
#1  2 1041
#2  4  474
#3  8  192
#4 10  148
#5 12   96
##
#complete("specdata", 30:25)
##
#  id nobs
#1 30  932
#2 29  711
#3 28  475
#4 27  338
#5 26  586
#6 25  463
##
#complete("specdata", 3)
##
#  id nobs
#1  3  243
##

