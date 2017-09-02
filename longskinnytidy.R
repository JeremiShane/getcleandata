## Created by: Jeremi Summerhill
## updated 09/01/2017
## Coursera Data Science - Getting and Cleaning Data Assignment
## Description: long and skinny version of tidy data file

longskinnytidy <- function(datadir=getwd(), writedir=getwd()){
        library(plyr)  ## load library plyr before dplyr
        library(dplyr)
        library(reshape)
        
        ##this function accepts a directory to retrieve data, and
        ##...a directory to write data
        ## writes the following files to writedir
        ## 
        ## “longskinnytidy.txt”
        
        ## read the feature labels and idenfifiers into R
        d <- paste(datadir, "/tidy_avg_mean_and_std_features.txt", sep="") ## set file directory and name
        dftidy <- read.table(d, header=T, strip.white=TRUE)
        
        dfls <- melt(dftidy, id=c("subject.id", "activity.id", "activity"))
        
        d <- paste(writedir, "/longskinnytidy.txt", sep="")
        write.table(dfls, d, sep=" ", col.names=TRUE, row.names=FALSE, quote=FALSE)
        
        ## output number of columns and rows
        x <- length(dfls)
        rdf <- c(x, nrow(dfls))
        rdf
}