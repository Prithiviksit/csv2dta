#!/usr/bin/env Rscript
Args<-commandArgs()

#setwd("/home/root1/R/match_index")

#check arguments
if (length(Args)<6){
  stop("No Arguments, please add file names")
}
Name<-Args[6:length(Args)]




#check packages
necessary<-c("haven","data.table","doParallel")
installed<-necessary %in% installed.packages()[,"Package"]
if (sum(!installed)>0){
  stop(paste("Package",paste(necessary,collapse=", "),"is/are not installed. Please install the package(s) first."))
}

library(haven)
library(data.table)
library(doParallel)

# Modify the names
if(sum(grepl(".csv.csv",Name)>0)){
  stop("I can not deal with files containing .csv.csv, please properly name the file.")
}
Name<-sub(".csv","",Name)

num<-min(30,length(Args)-5)
cl<-makeCluster(num)
registerDoParallel(cl)
foreach(i=1:length(Name),.packages = c("data.table","haven")) %dopar% {
  df<-fread(paste(Name[i],".csv",sep=""))
  write_dta(df,paste(Name[i],".dta",sep=""))
  rm(df)
  gc()
}
stopCluster(cl)
