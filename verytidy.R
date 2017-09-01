## Created by: Jeremi Summerhill
## updated 09/01/2017
## Coursera Data Science - Getting and Cleaning Data Assignment
## Description: Get and Tidy a dataset from research to identify human movements
## from accelerometer and gyro on samsung mobile

## after submitting the assignment I realized that I could one step further
## upon another review of the features.txt file it seems I misunderstood
## the "f" prefix and labeled it as meaning frequency instead of FFT
## This function verytidy() takes the file produced by 
## run_analysis.R and makes it very tidy and corrects my mistakes
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
        ## body is repeated body.body in some headers
        vcols <- colnames(dftidy)
        vcols <- gsub("body\\.body","body",vcols)
        colnames(dftidy) <- vcols ## replace the column headers
        
        ## for our very tidy dataset we will have the following columns
        ## subject.id = the participant unique subject id
        ## activity = the descriptive name of the activity measured
        ## domain = time or FFT
        ## accelerationsignal = body or gravity
        ## sensor = accelerometer or gyroscope (accelerometer improperly labelled as acceleration)
        ## estimation = mean, meanfrequency, or standarddeviation
        ## jerk = 1 or 0 (True or False)
        ## direction = x, y, z, or magnitude (calculate by euclidean norm of signals)
        ## featureaverage
        
        dfverytidy <- data.frame(subject.id=numeric(), activity=factor(), domain=factor(), accelerationsignal=factor(), sensor=factor(), estimation=factor(), jerk=logical(), direction=factor(), featureaverage=numeric())
        ## dfverytidy
        
        ## now for each column in "/tidy_avg_mean_and_std_features.txt"
        ## parse the header and identify which variables are present and
        ## their values, then the numeric values in the column rows will
        ## be the featureaverage
        
        r = 1 ## start our row at 1 for dfverytidy
        tr <- nrow(dftidy) ## how many rows will we need to loop through
        
        ## we know the first 3 columns are subject and activity so we start at 4
        for (i in 4:82) { 
                thiscolname <- colnames(dftidy[i,])
                ## return(strsplit(thiscolname, "\\."))
                return(thiscolname)
               
                 ## need to loop through every row of data for this column
                ## we know the first 3 columns are subject and activity
                for (j in 1:tr) {
                        subject <- dftidy[1, j]
                        activity <- dftidy[3, j]
                        
                        
                        ## use rbind to bind each row to verytidy
                }
  
        }
       ##  
}
