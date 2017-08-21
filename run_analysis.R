## get data and produce tidy data set for future analysis
## data collected from smart phone accelerometer data
## purpose of original data set to recognize human activity

## the features data represent calculated measurements from the 
##..acceleraometer and gyro readings.
##WE will ONLY extract data that contain the mean and standard deviation 
##...measures from the features

## Then the final data set will produce the average of these measures by
##..subject and activity.  Resulting in only one row of data per subject
##..and activity

## the data comes split into test and training data sets
## Note - a requirement for this analysis is to combine the test and training data

## each test and train data set has its own set of files:
## one file contains the human subject identifiers for each row element
## and one file contains 561 calculated measurements (features) for each row
## one file contains the activity label identifiers for each row element
## each of the files contains 2947 rows of data
## one file contains the activity id and label for each activity
## one file contains id and label for each feature

getclean <- function(datadir="~/desktop/coursera/assignments/5/data/", writedir="~/desktop/coursera/assignments/5/getcleandata/"){
  library(dplyr)
        
        ##this function accepts a directory to retrieve data, and
        ##...a directory to write data
        
        ## this funciton will write out the following files:
        ## “tidy_avg_mean_and_std_features.txt”
        ## "mean_and_std_features.txt"
        
        ## this funciton returns df which is 
        ##...same as “tidy_avg_mean_and_std_features.txt”
        ##...with the addition of acticity label in the df
        
        ## read the feature labels and idenfifiers into R
        d <- paste(datadir, "features.txt", sep="") ## set file directory and name
        featureLabels <- read.table(d, col.names=c("id", "feature"), strip.white=TRUE)
        vFeatures <- featureLabels$feature ## vector of labels
        
        ## read the activity labels and identifiers
        d <- paste(datadir, "activity_labels.txt", sep="")
        activityLabels <- read.table(d, col.names=c("id", "activity"), strip.white=TRUE)
        vActivity <- activityLabels$activity ## vector of labels
        
        ## read the test features into R
        d <- paste(datadir, "X_test.txt", sep="")
        testFeatures <- read.table(d, strip.white=TRUE, col.names=vFeatures)
        
        ## read the train features into R
        d <- paste(datadir, "X_train.txt", sep="")
        trainFeatures <- read.table(d, strip.white=TRUE, col.names=vFeatures)
        
        ## read the test subject identifiers into R
        d <- paste(datadir, "subject_test.txt", sep="")
        testSubjectId <- read.table(d, strip.white=TRUE, col.names="id")
        vTestSubject <- testSubjectId$id
        
        ## read the train subject identifiers into R
        d <- paste(datadir, "subject_train.txt", sep="")
        trainSubjectId <- read.table(d, strip.white=TRUE, col.names="id")
        vTrainSubject <- trainSubjectId$id
        
        ## read the test activity idenfifiers into R
        d <- paste(datadir, "y_test.txt", sep="")
        testActivityId <- read.table(d, strip.white=TRUE, col.names="id")
        vTestActivity <- testActivityId$id
        
        ## read the train activity identifiers into R
        d <- paste(datadir, "y_train.txt", sep="")
        trainActivityId <- read.table(d, strip.white=TRUE, col.names="id")
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
        
        ## extract the mean and standard deviation measures
        meanstdFeatures <- allFeatures[,grep("mean|std", names(allFeatures), value=TRUE)]
        x <- length(meanstdFeatures) ## count of columns
        ## write a file with our mean and std feature names
        d <- paste(writedir, "mean_and_std_features.txt", sep="")
        write.table(names(meanstdFeatures), d, sep=" ", col.names=FALSE, row.names=1:x, quote=FALSE)
        
        meanstdFeatures$activity_id <- vActivity
        meanstdFeatures$subject_id <- vSubjects
        
        ## now to average the measures by subject, and activity
        df <- ddply(meanstdFeatures, c("subject_id", "activity_id"), colMeans)
        
        ## adding in the activity_label as a column
        df <- merge(df, activityLabels, by.x="activity_id", by.y="id")
        ##write our final tidy file out
        d <- paste(writedir, "tidy_avg_mean_and_std_features.txt", sep="")
        write.table(df, d, sep=" ", col.names=TRUE, row.names=FALSE, quote=FALSE)
        df
}
