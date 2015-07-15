library(survival)
source("getData.R")
source("util.R")
Recurrence_Plot <- function(file, time, status, gene)
{
  rawdata=getData(file, c(time, status, gene))
  #rawdata = rawrawdata[,c(time,status,gene)]
  names(rawdata) = c("time", "status", "gene")
  rawdata$event = rep(NA, nrow(rawdata))
  rawdata$event[rawdata$status=="No Recurrence"] = 0
  rawdata$event[rawdata$status=="Recurrence"] = 1
  rawdata = rawdata[(!is.na(rawdata$time))&(!is.na(rawdata$event)),]
  
  # if cut into two groups
  temp2 = rawdata
  temp2$group = as.numeric(cut(temp2$gene, quantile(temp2$gene, c(0, 1/2, 1), na.rm=T)))
  temp2 = temp2[!is.na(temp2$group),]
  survplot(temp2$time, temp2$event, temp2$group, temp2$gene, c(  paste(gene, " -", sep=""), paste(gene, " +", sep="")), gsub(".csv", " Recurrence 2 Groups",file))
  
  # if cut into three groups
  temp3= rawdata
  temp3$group = as.numeric(cut(temp3$gene, quantile(temp3$gene, c(0, 1/3, 2/3, 1), na.rm=T)))
  temp3$group[temp3$group==2] = 0
  temp3 = temp3[!is.na(temp3$group),]
  survplot(temp3$time, temp3$event, temp3$group, temp3$gene, c(  paste(gene, " -", sep=""), paste(gene, " +", sep="")), gsub(".csv", " Recurrence 3 Groups",file))
  
  #if cut into four groups
  temp4= rawdata
  temp4$group = as.numeric(cut(temp4$gene, quantile(temp4$gene, c(0, 1/4, 1/2, 3/4, 1), na.rm=T)))
  temp4$group[temp4$group==2] = 0
  temp4$group[temp4$group==3] = 0
  temp4 = temp4[!is.na(temp4$group),]
  survplot(temp4$time, temp4$event, temp4$group, temp4$gene, c(  paste(gene, " -", sep=""), paste(gene, " +", sep="")), gsub(".csv", " Recurrence 4 Groups",file))
}