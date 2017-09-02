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
        return(dftidy)
        ##return(str(dftidy))
        ## still see some cleanup to be done in column headers
        ## body is repeated body.body in some headers
        vcols <- colnames(dftidy)
        vcols <- gsub("body\\.body","body",vcols)
        colnames(dftidy) <- vcols ## replace the column headers
        
        ## for our very tidy dataset we will have the following columns
        ## subject.id = the participant unique subject id
        ## activity = the descriptive name of the activity measured
        ## domain = time or FFT (frequency by fast fourier transform)
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
        thiscolnames <- colnames(dftidy)
        
        ## we know the first 3 columns are subject and activity so we start at 4
        ## there are 9 columns in dfverytidy
        
        for (i in 4:82) {
                
                thiscol <- strsplit(thiscolnames[i], "\\.")
                vcol <- thiscol[[1]] 
                l <- length(vcol)
                
                ## domain is position 1 in thiscol
                domain <- vcol[1]
                ## accelerationsignal is 2
                accelerationsignal <- vcol[2]
                ## sensor is 3
                sensor <- vcol[3]
                jerk <- 0 ## by default
                
                ## estimation is 4
                ## if theres a jerk then jerk is 4 and estimation is 5
                ## if theres a magnitude then magnitude is 4 and estimation is 5, stops here
                ## if there is a jerk and mag then 4, 5, then estimation 6 stops
                ## direction is magnitude or estimation position +1
                
                if (vcol[4] == "jerk") {
                        jerk <- 1
                        if (vcol[5] == "magnitude") {
                                direction <- vcol[5]
                                estimation <- vcol[6]
                        } else {
                                estimation <- vcol[5]
                                direction <- vcol[6]
                        }
                } else if (vcol[4] == "magnitude") {
                        jerk <- 0
                        direction <- vcol[4]
                        estimation <- vcol[5]
                } else {
                        estimation <- vcol[4]
                        direction <- vcol[5]
                }
               
                 ## need to loop through every row of data for this column
                ## we know the first 3 columns are subject and activity
                for (j in 1:tr) {
                       
                        subject <- dftidy[j, "subject.id"]
                        activity <- as.character(dftidy[j, "activity"])
                        ##return(activity)
                        featureaverage <- dftidy[j, thiscolnames[i]]
                        
## subject, activity, domain, accelerationsignal, sensor, estimation, jerk, direction, featureaverage
                       newrow <- c(subject, activity, domain, accelerationsignal, sensor, estimation, jerk, direction, featureaverage)
                       ##return(newrow) 
                       ## use rbind to bind each row to verytidy
                       return(dfverytidy)
                       dfverytidy <- rbind(dfverytidy, newrow)
                       return(dfverytidy)
                }
  
        }
       ##  
}
