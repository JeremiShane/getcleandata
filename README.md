# getcleandata
coursera getting and cleaning data peer reviewed assignment.  data from UCI Machine Learning repository for human activity recognition from smart phone data.

The goal of this project is to produce tidy data that can be used for future analyisis.

The data is obtained is collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The project file run_analysis.R does the following:
1.  Merges the training and the test sets to create one data set.
2.  Extracts only the measurements on the mean and standard deviation for each measurement.
3.  Creates a second, independent tidy data set with the average of each variable for each activity and each subject.  

The final tidy data set:
1. the average of each variable for each activity and each subject...to contain only one row per subject and activity measured.
Example: So if subject #1 were to have 10 feature rows for WALKING activity, our new file now has 1 row for subject #1 and WALKING activity and where all the column measures are now averages across those 10 rows.

Note - I have included the activity names as a column in the final data set.  
