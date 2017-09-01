## Created by: Jeremi Summerhill
## updated 08/30/2017
## Coursera Data Science - Getting and Cleaning Data Assignment
## Description: Get and Tidy dataset from research to identify human movements
## from accelerometer and gyro on samsung mobile
## For full description see CodeBook.md, and Readme.md


getclean <- function(datadir=getwd(), writedir=getwd()){
        library(plyr)  ## load library plyr before dplyr
        library(dplyr)
        
        ##this function accepts a directory to retrieve data, and
        ##...a directory to write data
        ## writes the following files to writedir
        ## 
        ## “tidy_avg_mean_and_std_features.txt”
        ## "mean_and_std_features.txt"
        ## "descriptive_mean_and_std_features.txt"
        
        ## this funciton returns df which is 
        ##...same as “tidy_avg_mean_and_std_features.txt”
        
        ## read the feature labels and idenfifiers into R
        d <- paste(datadir, "/features.txt", sep="") ## set file directory and name
        featureLabels <- read.table(d, col.names=c("id", "feature"), strip.white=TRUE)
        vFeatures <- featureLabels$feature ## vector of feature labels
        
        ## read the activity labels and identifiers
        d <- paste(datadir, "/activity_labels.txt", sep="")
        dfactivityLabels <- read.table(d, col.names=c("activity.id", "activity"), strip.white=TRUE)
        ##vActivity <- activityLabels$activity ## vector of labels
        ##return(dfactivityLabels)
        
        ## read the test features into R
        d <- paste(datadir, "/X_test.txt", sep="")
        testFeatures <- read.table(d, strip.white=TRUE, col.names=vFeatures, colClasses = "numeric")
        
        ## read the train features into R
        d <- paste(datadir, "/X_train.txt", sep="")
        trainFeatures <- read.table(d, strip.white=TRUE, col.names=vFeatures, colClasses = "numeric")
        
        ## read the test subject identifiers into R
        d <- paste(datadir, "/subject_test.txt", sep="")
        testSubjectId <- read.table(d, strip.white=TRUE, col.names="id", colClasses = "numeric")
        vTestSubject <- testSubjectId$id
        
        ## read the train subject identifiers into R
        d <- paste(datadir, "/subject_train.txt", sep="")
        trainSubjectId <- read.table(d, strip.white=TRUE, col.names="id", colClasses = "numeric")
        vTrainSubject <- trainSubjectId$id
        
        ## read the test activity idenfifiers into R
        d <- paste(datadir, "/y_test.txt", sep="")
        testActivityId <- read.table(d, strip.white=TRUE, col.names="id", colClasses = "numeric")
        vTestActivity <- testActivityId$id
        
        ## read the train activity identifiers into R
        d <- paste(datadir, "/y_train.txt", sep="")
        trainActivityId <- read.table(d, strip.white=TRUE, col.names="id", colClasses = "numeric")
        vTrainActivity <- trainActivityId$id
        
        ## now need to add variables for the activity and subject ids 
        ##...to our features data
        testFeatures$subject_id <- vTestSubject
        trainFeatures$subject_id <- vTrainSubject
        testFeatures$activity_id <- vTestActivity
        trainFeatures$activity_id <- vTrainActivity
        
        ##now we can bind the train and test data together
        allFeatures <- rbind(testFeatures, trainFeatures)
        vSubjects <- allFeatures$subject_id
        vActivity <- allFeatures$activity_id
        
        ## extract the mean and standard deviation feature measures
        dfmeanstdFeatures <- allFeatures[,grep("mean|std", names(allFeatures), value=TRUE)]
        x <- length(dfmeanstdFeatures) ## count of columns
        
        ## write a file with our mean and std feature names
        d <- paste(writedir, "mean_and_std_features.txt", sep="")
        write.table(names(dfmeanstdFeatures), d, sep=" ", col.names=FALSE, row.names=1:x, quote=FALSE)
        
        ## add columns for activity id and subject id
        dfmeanstdFeatures$activity.id <- vActivity
        dfmeanstdFeatures$subject.id <- vSubjects
        
        ## now to average the measures by subject, and activity
        ## ddply will take the column means and group the data frame by subject and activity
        ## so we will only be left with one row per subject and activity and 
        ## each column will contain the mean of each measure taken for that subject and activity
        df <- ddply(dfmeanstdFeatures, c("subject.id", "activity.id"), colMeans)
        
        ## adding in the activity label as a column
        df <- merge(df, dfactivityLabels, by.x="activity.id", by.y="activity.id", sort=FALSE)
        
        vDescriptiveMeanStdFeatures <- colnames(df)
        ## making a new vector for the new descriptive column names for tidy dataset
        vDescriptiveMeanStdFeatures <- gsub("\\.","",vDescriptiveMeanStdFeatures)
        vDescriptiveMeanStdFeatures <- gsub("^t","time",vDescriptiveMeanStdFeatures)
        vDescriptiveMeanStdFeatures <- gsub("^f","fft",vDescriptiveMeanStdFeatures)
        vDescriptiveMeanStdFeatures <- gsub("Freq","frequency",vDescriptiveMeanStdFeatures)
        vDescriptiveMeanStdFeatures <- gsub("BodyAcc","\\.body\\.acceleration",vDescriptiveMeanStdFeatures)
        vDescriptiveMeanStdFeatures <- gsub("GravAcc","\\.gravity\\.acceleration",vDescriptiveMeanStdFeatures)
        vDescriptiveMeanStdFeatures <- gsub("GravityAcc","\\.gravity\\.acceleration",vDescriptiveMeanStdFeatures)
        vDescriptiveMeanStdFeatures <- gsub("BodyBody","\\.body",vDescriptiveMeanStdFeatures)
        vDescriptiveMeanStdFeatures <- gsub("Body","\\.body",vDescriptiveMeanStdFeatures)
        vDescriptiveMeanStdFeatures <- gsub("Gyro","\\.gyroscope",vDescriptiveMeanStdFeatures)
        vDescriptiveMeanStdFeatures <- gsub("Mag","\\.magnitude",vDescriptiveMeanStdFeatures)
        vDescriptiveMeanStdFeatures <- gsub("Jerk","\\.jerk",vDescriptiveMeanStdFeatures)
        vDescriptiveMeanStdFeatures <- gsub("std","\\.standarddeviation",vDescriptiveMeanStdFeatures)
        vDescriptiveMeanStdFeatures <- gsub("X","\\.xdirection",vDescriptiveMeanStdFeatures)
        vDescriptiveMeanStdFeatures <- gsub("Y","\\.ydirection",vDescriptiveMeanStdFeatures)
        vDescriptiveMeanStdFeatures <- gsub("Z","\\.zdirection",vDescriptiveMeanStdFeatures)
        vDescriptiveMeanStdFeatures <- gsub("mean","\\.mean",vDescriptiveMeanStdFeatures)
        vDescriptiveMeanStdFeatures <- gsub("activityid","activity\\.id",vDescriptiveMeanStdFeatures)
        vDescriptiveMeanStdFeatures <- gsub("subjectid","subject\\.id",vDescriptiveMeanStdFeatures)
        
        ## replace the column names with the descriptive column names
        colnames(df) <- vDescriptiveMeanStdFeatures
        ##df$activity.id <-- NULL
        df <- df %>% select(subject.id, activity.id, activity, everything())
        df <- arrange(df, subject.id)
        
        ## write a file of our descriptive feature column names
        d <- paste(writedir, "/descriptive_mean_and_std_features.txt", sep="")
        x <- length(df)
        write.table(names(df), d, sep=" ", col.names=FALSE, row.names=1:x, quote=FALSE)
        
        ##write our final tidy file out
        d <- paste(writedir, "/tidy_avg_mean_and_std_features.txt", sep="")
        write.table(df, d, sep=" ", col.names=TRUE, row.names=FALSE, quote=FALSE)
        
        d <- paste(writedir, "/tidy.csv", sep="")
        write.csv(df, d, quote=FALSE)
        
        ## output number of columns and rows
        rdf <- c(x, nrow(df))
        rdf
}
