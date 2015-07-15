library(survival)
source("getData.R")
source("util.R")
Survival_Plot <- function(file, time, status, gene)
{
  rawdata=getData(file, c(time, status, gene))
  #rawdata = rawrawdata[,c(time,status,gene)]
  names(rawdata) = c("time", "status", "gene")
  rawdata$event = rep(NA, nrow(rawdata))
  rawdata$event[rawdata$status=="Alive"] = 0
  rawdata$event[rawdata$status=="Dead"] = 1
  rawdata = rawdata[(!is.na(rawdata$time))&(!is.na(rawdata$event)),]
  
  # if cut into two groups
  temp2 = rawdata
  temp2$group = as.numeric(cut(temp2$gene, quantile(temp2$gene, c(0, 1/2, 1), na.rm=T)))
  temp2 = temp2[!is.na(temp2$group),]
  survplot(temp2$time, temp2$event, temp2$group, temp2$gene, c(  paste(gene, " -", sep=""), paste(gene, " +", sep="")), gsub(".csv", " Survival 2 Groups",file))
  
  # if cut into three groups
  temp3= rawdata
  temp3$group = as.numeric(cut(temp3$gene, quantile(temp3$gene, c(0, 1/3, 2/3, 1), na.rm=T)))
  temp3$group[temp3$group==2] = 0
  temp3 = temp3[!is.na(temp3$group),]
  survplot(temp3$time, temp3$event, temp3$group, temp3$gene, c(  paste(gene, " -", sep=""), paste(gene, " +", sep="")), gsub(".csv", " Survival 3 Groups",file))
  
  #if cut into four groups
  temp4= rawdata
  temp4$group = as.numeric(cut(temp4$gene, quantile(temp4$gene, c(0, 1/4, 1/2, 3/4, 1), na.rm=T)))
  temp4$group[temp4$group==2] = 0
  temp4$group[temp4$group==3] = 0
  temp4 = temp4[!is.na(temp4$group),]
  survplot(temp4$time, temp4$event, temp4$group, temp4$gene, c(  paste(gene, " -", sep=""), paste(gene, " +", sep="")), gsub(".csv", " Survival 4 Groups",file))
  
  #if cut into five groups
  temp5= rawdata
  temp5$group = as.numeric(cut(temp5$gene, quantile(temp5$gene, c(0, 1/5, 2/5, 3/5, 4/5, 1), na.rm=T)))
  temp5$group[temp5$group==2] = 0
  temp5$group[temp5$group==3] = 0
  temp5$group[temp5$group==4] = 0
  temp5 = temp5[!is.na(temp5$group),]
  survplot(temp5$time, temp5$event, temp5$group, temp5$gene, c(  paste(gene, " -", sep=""), paste(gene, " +", sep="")), gsub(".csv", " Survival 5 Groups",file))

  #if cut into six groups
  temp6= rawdata
  temp6$group = as.numeric(cut(temp6$gene, quantile(temp6$gene, c(0, 1/6, 1/3, 1/2, 2/3, 5/6, 1), na.rm=T)))
  temp6$group[temp6$group==2] = 0
  temp6$group[temp6$group==3] = 0
  temp6$group[temp6$group==4] = 0
  temp6$group[temp6$group==5] = 0
  temp6 = temp6[!is.na(temp6$group),]
  survplot(temp6$time, temp6$event, temp6$group, temp6$gene, c(  paste(gene, " -", sep=""), paste(gene, " +", sep="")), gsub(".csv", " Survival 6 Groups",file))
}
  
