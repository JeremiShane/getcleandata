## Created by: Jeremi Summerhill
## updated 09/01/2017
## Coursera Data Science - Getting and Cleaning Data Assignment
## Description: Get and Tidy a dataset from research to identify human movements
## from accelerometer and gyro on samsung mobile

## after submitting the assignment I realized that I could one step further
## for a very tidy dataset.  This function takes the file produced by 
## run_analysis.R and makes it very tidy
## For full description see VeryTidyCodeBook.md, and Readme.md


verytidy <- function(datadir=getwd(), writedir=getwd()){
        library(plyr)  ## load library plyr before dplyr
        library(dplyr)
        
        ##this function accepts a directory to retrieve data, and
        ##...a directory to write data
        ## writes the following files to writedir
        ## 
        ## “verytidy.txt”
        
        ## read the feature labels and idenfifiers into R
        d <- paste(datadir, "/tidy_avg_mean_and_std_features.txt", sep="") ## set file directory and name
        dftidy <- read.table(d, header=T, strip.white=TRUE)

        ##return(str(dftidy))
        ## still see some cleanup to be done in column headers
        vcols <- colnames(dftidy)
        vcols <- gsub("body\\.body","body",vcols)
        vcols
}
