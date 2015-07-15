source("getData.R")
source("util.R")

Scatter_Plot <- function(file, genes, avg= F)
{
  rawdata = getData(file, genes)
  i=2
  while(i <= length(genes))
  {
    scatterplot(rawdata[,1], rawdata[,i], c(genes[1], genes[i]), file, isave=F)
    i=i+1
  }
  
  if(avg)
  {
    scatterplot(rawdata[,1], rowMeans(rawdata[,2:length(genes)]), c(genes[1], paste(strtrim(genes[2], 5), " AVG", sep= "") ), file, isave=F)
  }
}
#scatterplot(data$USP17L2, data$VIM...A_23_P161190, c("USP17L2", "VIM"), "Finak_Breast", isave=F)
# take the average of two VIM probes
#scatterplot(data$USP17L2, rowMeans(data[,2:3]), c("USP17L2", "VIM"), "Finak_Breast", isave=F)