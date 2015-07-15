source("R_format.R")

getData<- function(file, dataNames)
{
  dataNames<- R_format(dataNames)
  rawdata = read.csv(file, skip=1, stringsAsFactors=F) #reads the csv file skipping the 1st line in the file
  mydata<- rawdata[,dataNames[1:length(dataNames)]]
  return(mydata) #Vector containing the csv file name, independent variable x, and dependent variable y data as a vector    
}