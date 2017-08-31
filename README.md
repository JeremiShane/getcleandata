# getcleandata
coursera getting and cleaning data peer reviewed assignment.

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

# How To
## getclean <- function(datadir=getwd(), writedir=getwd())

#### 1.  place data in working directory or in a directory of your choosing
#### 2.  pass the function getclean() parameters indicating where your data is and where you want it to write the new tidy data file.  i.e.  df <- getclean() will use the default working directory.
#### 3. the “tidy_avg_mean_and_std_features.txt” will be written to the directory specified.  
#### 4. the getclean function will return the number of columns and rows in your tidy dataset

### the data contained in the resulting tidy file “tidy_avg_mean_and_std_features.txt” is explained in the file "CodeBook.md"

# run_analysis.R explained

Description: Get dataset and Tidy the dataset.  This dataset is from research to identify human movements with accelerometer and gyroscope on samsung mobile.
### For full description see CodeBook.md, and Readme.md

## the function getclean()
## getclean <- function(datadir=getwd(), writedir=getwd()){

library plyr should be loaded before dplyr
        
## the function...
reads the feature labels from the original dataset
reads the activity labels from the original dataset
reads the test feature measurement data
reads the train feature measurement data
uses rbind to combine the train and test data sets
adds the columns for activity_id and subject_id
uses grep to extract only the data columns for mean and standard deviation feature measurements
writes out file "mean_and_std_features.txt" which contains all the original column labels for mean and std features
uses ddply to apply colmeans to each column in the new data frame that contains the mean and std features, ddply groups the data frame by subject and activity
the resulting data frame df contains the average of each mean and standard deviation feature measurement by subject and activity.  this results in only one row per subject and activity,...6 rows per subject as there are 6 activities
uses gsub to tidy the column names and make them more readable and descriptive
writes out a file of the descriptive column names "descriptive_mean_and_std_features.txt"
arranges the columns for better readability
writes out the tidy dataset to "tidy_avg_mean_and_std_features.txt" and then to "tidy.csv"
returns the number of columns and number of rows in the dataset 

