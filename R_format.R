R_format <- function(x)
{
  x<-gsub(" ", ".",x) #Replaces spaces with decimal (.)
  x<-gsub("\\(",".", x) #Replaces open parentheses ("(") with decimal
  x<-gsub("\\)",".", x) #Replaces Close parentheses (")") with decimal
  x<-gsub("\\/",".", x) #Replaces Close parentheses (")") with decimal
  return(x)
 
}