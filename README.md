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


# getcleandata
coursera getting and cleaning data peer reviewed assignment.  data from UCI Machine Learning repository for human activity recognition from smart phone data.

The goal of this project is to produce tidy data that can be used for future analyisis.

The data obtained is collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The project file run_analysis.R does the following:
1.  Merges the training and the test sets to create one data set.
2.  Extracts only the measurements on the mean and standard deviation for each measurement.
3.  Creates a new tidy data set “tidy_avg_mean_and_std_features.txt” with the average of each variable for each activity and each subject.  

Example: So if subject #1 were to have 10 feature rows for WALKING activity, our new file now has 1 row for subject #1 and WALKING activity and where all the column measures are now averages across those 10 rows.  

“tidy_avg_mean_and_std_features.txt” is explained in the file "code_book_features_info.txt"

# How To
getclean <- function(datadir=getwd(), writedir=getwd())

1.  place data in working directory or in a directory of your choosing
2.  pass the function getclean() parameters indicating where your data is at and where you want it to write the new tidy data file
     i.e.  df <- getclean() ## this will use the default working directory.
3. the “tidy_avg_mean_and_std_features.txt” will be written to the directory specified.  
4. df will contain the data frame
