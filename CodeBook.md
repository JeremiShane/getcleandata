
# CodeBook

## Description of Original Data
> The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

> Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

> Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

> These signals were used to estimate variables of the feature vector for each pattern:  
> '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

> | Signals |
> | ------------- |
> | tBodyAcc-XYZ
> | tGravityAcc-XYZ
> | tBodyAccJerk-XYZ
> | tBodyGyro-XYZ
> | tBodyGyroJerk-XYZ
> | tBodyAccMag
> | tGravityAccMag
> | tBodyAccJerkMag
> | tBodyGyroMag
> | tBodyGyroJerkMag
> | fBodyAcc-XYZ
> | fBodyAccJerk-XYZ
> | fBodyGyro-XYZ
> | fBodyAccMag
> | fBodyAccJerkMag
> | fBodyGyroMag
> | fBodyGyroJerkMag

> The set of variables that were estimated from these signals are: 

> | Estimated Variable | Description |
> | ------------------ | --------------------- |
> | mean() | Mean value
> | std() | Standard deviation
> | mad() | Median absolute deviation 
> | max() | Largest value in array
> | min() | Smallest value in array
> | sma() | Signal magnitude area
> | energy() | Energy measure. Sum of the squares divided by the number of values. 
> | iqr() | Interquartile range 
> | entropy() | Signal entropy
> | arCoeff() | Autorregresion coefficients with Burg order equal to 4
> | correlation() | correlation coefficient between two signals
> | maxInds() | index of the frequency component with largest magnitude
> | meanFreq() | Weighted average of the frequency components to obtain a mean frequency
> | skewness() | skewness of the frequency domain signal 
> | kurtosis() | kurtosis of the frequency domain signal 
> | bandsEnergy() | Energy of a frequency interval within the 64 bins of the FFT of each window.
> | angle() | Angle between to vectors.

> Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

> | Additional Vectors |
> | ------------------ | 
> | gravityMean
> | tBodyAccMean
> | tBodyAccJerkMean
> | tBodyGyroMean
> | tBodyGyroJerkMean

> The complete list of variables of each feature vector is available in 'features.txt'

## End Description of Original Data

# Description of Tidy Data Set
### Now to describe the new tidy dataset produced by run_analysis.R

## First the new dataset consists only of the following estimated variables:

| Estimated Variable | Description |
| ------------------ | --------------------- |
| mean() | Mean value
| std() | Standard deviation
| meanFreq() | Weighted average of the frequency components to obtain a mean frequency

## Second our dataset is an average of these estimated variables by subject and activity.  
##### So where we once had multiple readings for each subject and activity our new dataset has only one row per subject and activity which is 6 rows per subject since there are 6 activities.  There are 82 columns and 180 rows in the dataset.

> Note: Features are normalized and bounded within [-1,1].

## Tidy Dataset

| Row# | Variable | type | Range | Description |
| ----- | ------- | ---- | ----- | ----------- |
| 1 | subject.id | num | 1-30 | unique identifier of each participant
| 2 | activity.id | num | 1-6 | unique identifier and index of physical activity
| 3 | activity | factor | WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING | the text label descriptions of each physical activity measured in the experiment
| 4 | time.body.acceleration.mean.xdirection | num  | -1 to 1  | the average mean of the time domain body acceleration in the x direction
| 5 | time.body.acceleration.mean.ydirection | num  | -1 to 1  | the average mean of the time domain body acceleration in the y direction
| 6 | time.body.acceleration.mean.zdirection | num  | -1 to 1  | the average mean of the time domain body acceleration in the z direction
| 7 | time.body.acceleration.standarddeviation.xdirection | num  | -1 to 1  | the average standard deviation of the time domain body acceleration in the x direction
| 8 | time.body.acceleration.standarddeviation.ydirection | num  | -1 to 1  | the average standard deviation of the time domain body acceleration in the y direction
| 9 | time.body.acceleration.standarddeviation.zdirection | num  | -1 to 1  | the average standard deviation of the time domain body acceleration in the z direction
| 10 | time.gravity.acceleration.mean.xdirection | num  | -1 to 1  | the average mean of the time domain gravity acceleration in the x direction
| 11 | time.gravity.acceleration.mean.ydirection | num  | -1 to 1  | the average mean of the time domain gravity acceleration in the y direction
| 12 | time.gravity.acceleration.mean.zdirection | num  | -1 to 1  | the average mean of the time domain gravity acceleration in the z direction
| 13 | time.gravity.acceleration.standarddeviation.xdirection | num  | -1 to 1  | the average standard deviation of the time domain gravity acceleration in the x direction
| 14 | time.gravity.acceleration.standarddeviation.ydirection | num  | -1 to 1  | the average standard deviation of the time domain gravity acceleration in the y direction
| 15 | time.gravity.acceleration.standarddeviation.zdirection | num  | -1 to 1  | the average standard deviation of the time domain gravity acceleration in the z direction
| 16 | time.body.acceleration.jerk.mean.xdirection | num  | -1 to 1  | the average mean of the time domain body acceleration jerk in the x direction
| 17 | time.body.acceleration.jerk.mean.ydirection | num  | -1 to 1  | the average mean of the time domain body acceleration jerk in the y direction
| 18 | time.body.acceleration.jerk.mean.zdirection | num  | -1 to 1  | the average mean of the time domain body acceleration jerk in the z direction
| 19 | time.body.acceleration.jerk.standarddeviation.xdirection | num  | -1 to 1  | the average standard deviation of the time domain body acceleration jerk in the x direction
| 20 | time.body.acceleration.jerk.standarddeviation.ydirection | num  | -1 to 1  | the average standard deviation of the time domain body acceleration jerk in the y direction
| 21 | time.body.acceleration.jerk.standarddeviation.zdirection | num  | -1 to 1  | the average standard deviation of the time domain body acceleration jerk in the z direction
| 22 | time.body.gyroscope.mean.xdirection | num  | -1 to 1  | the average mean of the time domain body angluar velocity in the x direction
| 23 | time.body.gyroscope.mean.ydirection | num  | -1 to 1  | the average mean of the time domain body angluar velocity in the y direction
| 24 | time.body.gyroscope.mean.zdirection | num  | -1 to 1  | the average mean of the time domain body angluar velocity in the z direction
| 25 | time.body.gyroscope.standarddeviation.xdirection | num  | -1 to 1  | the average standard deviation of the time domain body angluar velocity in the x direction
| 26 | time.body.gyroscope.standarddeviation.ydirection | num  | -1 to 1  | the average standard deviation of the time domain body angluar velocity in the y direction
| 27 | time.body.gyroscope.standarddeviation.zdirection | num  | -1 to 1  | the average standard deviation of the time domain body angluar velocity in the z direction
| 28 | time.body.gyroscope.jerk.mean.xdirection | num  | -1 to 1  | the average mean of the time domain body angluar velocity jerk in the x direction
| 29 | time.body.gyroscope.jerk.mean.ydirection | num  | -1 to 1  | the average mean of the time domain body angluar velocity jerk in the y direction
| 30 | time.body.gyroscope.jerk.mean.zdirection | num  | -1 to 1  | the average mean of the time domain body angluar velocity jerk in the z direction
| 31 | time.body.gyroscope.jerk.standarddeviation.xdirection | num  | -1 to 1  | the average standard deviation of the time domain body angluar velocity jerk in the x direction
| 32 | time.body.gyroscope.jerk.standarddeviation.ydirection | num  | -1 to 1  | the average standard deviation of the time domain body angluar velocity jerk in the y direction
| 33 | time.body.gyroscope.jerk.standarddeviation.zdirection | num  | -1 to 1  | the average standard deviation of the time domain body angluar velocity jerk in the z direction
| 34 | time.body.acceleration.magnitude.mean | num  | -1 to 1  | the average mean of the magnitude of the time domain body acceleration
| 35 | time.body.acceleration.magnitude.standarddeviation | num  | -1 to 1  | the average standard deviation of the magnitude of the time domain body acceleration
| 36 | time.gravity.acceleration.magnitude.mean | num  | -1 to 1  | the average mean of the magnitude of the time domain gravity acceleration
| 37 | time.gravity.acceleration.magnitude.standarddeviation | num  | -1 to 1  | the average standard deviation of the magnitude of the time domain gravity acceleration
| 38 | time.body.acceleration.jerk.magnitude.mean | num  | -1 to 1  | the average mean of the magnitude of the time domain gravity acceleration jerk
| 39 | time.body.acceleration.jerk.magnitude.standarddeviation | num  | -1 to 1  | the average standard deviation of the magnitude of the time domain gravity acceleration jerk
| 40 | time.body.gyroscope.magnitude.mean | num  | -1 to 1  | the average mean of the magnitude of the time domain body angular velocity
| 41 | time.body.gyroscope.magnitude.standarddeviation | num  | -1 to 1  | the average standard deviation of the magnitude of the time domain body angular velocity
| 42 | time.body.gyroscope.jerk.magnitude.mean | num  | -1 to 1  | the average mean of the magnitude of the time domain body angular velocity jerk
| 43 | time.body.gyroscope.jerk.magnitude.standarddeviation | num  | -1 to 1  | the average standard deviation of the magnitude of the time domain body angular velocity jerk
| 44 | frequency.body.acceleration.mean.xdirection | num  | -1 to 1  | the average mean of the frequency domain body acceleration in the x direction
| 45 | frequency.body.acceleration.mean.ydirection | num  | -1 to 1  | the average mean of the frequency domain body acceleration in the y direction
| 46 | frequency.body.acceleration.mean.zdirection | num  | -1 to 1  | the average mean of the frequency domain body acceleration in the z direction
| 47 | frequency.body.acceleration.standarddeviation.xdirection | num  | -1 to 1  | the average standard deviation of the frequency domain body acceleration in the x direction
| 48 | frequency.body.acceleration.standarddeviation.ydirection | num  | -1 to 1  | the average standard deviation of the frequency domain body acceleration in the y direction
| 49 | frequency.body.acceleration.standarddeviation.zdirection | num  | -1 to 1  | the average standard deviation of the frequency domain body acceleration in the z direction
| 50 | frequency.body.acceleration.meanfrequency.xdirection | num  | -1 to 1  | the average mean frequency of the frequency domain body acceleration in the x direction
| 51 | frequency.body.acceleration.meanfrequency.ydirection | num  | -1 to 1  | the average mean frequency of the frequency domain body acceleration in the y direction
| 52 | frequency.body.acceleration.meanfrequency.zdirection | num  | -1 to 1  | the average mean frequency of the frequency domain body acceleration in the z direction
| 53 | frequency.body.acceleration.jerk.mean.xdirection | num  | -1 to 1  | the average mean of the frequency domain body acceleration jerk in the x direction
| 54 | frequency.body.acceleration.jerk.mean.ydirection | num  | -1 to 1  | the average mean of the frequency domain body acceleration jerk in the y direction
| 55 | frequency.body.acceleration.jerk.mean.zdirection | num  | -1 to 1  | the average mean of the frequency domain body acceleration jerk in the z direction
| 56 | frequency.body.acceleration.jerk.standarddeviation.xdirection | num  | -1 to 1  | the average standard deviation of the frequency domain body acceleration jerk in the x direction
| 57 | frequency.body.acceleration.jerk.standarddeviation.ydirection | num  | -1 to 1  | the average standard deviation of the frequency domain body acceleration jerk in the y direction
| 58 | frequency.body.acceleration.jerk.standarddeviation.zdirection | num  | -1 to 1  | the average standard deviation of the frequency domain body acceleration jerk in the z direction
| 59 | frequency.body.acceleration.jerk.meanfrequency.xdirection | num  | -1 to 1  | the average mean frequency of the frequency domain body acceleration jerk in the x direction
| 60 | frequency.body.acceleration.jerk.meanfrequency.ydirection | num  | -1 to 1  | the average mean frequency of the frequency domain body acceleration jerk in the y direction
| 61 | frequency.body.acceleration.jerk.meanfrequency.zdirection | num  | -1 to 1  | the average mean frequency of the frequency domain body acceleration jerk in the z direction
| 62 | frequency.body.gyroscope.mean.xdirection | num  | -1 to 1  | the average mean of the frequency domain body angular velocity in the x direction
| 63 | frequency.body.gyroscope.mean.ydirection | num  | -1 to 1  | the average mean of the frequency domain body angular velocity in the y direction
| 64 | frequency.body.gyroscope.mean.zdirection | num  | -1 to 1  | the average mean of the frequency domain body angular velocity in the z direction
| 65 | frequency.body.gyroscope.standarddeviation.xdirection | num  | -1 to 1  | the average standard deviation of the frequency domain body angular velocity in the x direction
| 66 | frequency.body.gyroscope.standarddeviation.ydirection | num  | -1 to 1  | the average mean of the frequency domain body angular velocity in the y direction
| 67 | frequency.body.gyroscope.standarddeviation.zdirection | num  | -1 to 1  | the average mean of the frequency domain body angular velocity in the z direction
| 68 | frequency.body.gyroscope.meanfrequency.xdirection | num  | -1 to 1  | the average mean frequency of the frequency domain body angular velocity in the x direction
| 69 | frequency.body.gyroscope.meanfrequency.ydirection | num  | -1 to 1  | the average mean frequency of the frequency domain body angular velocity in the y direction
| 70 | frequency.body.gyroscope.meanfrequency.zdirection | num  | -1 to 1  | the average mean frequency of the frequency domain body angular velocity in the z direction
| 71 | frequency.body.acceleration.magnitude.mean | num  | -1 to 1  | the average mean of the magnitude of the frequency domain body acceleration
| 72 | frequency.body.acceleration.magnitude.standarddeviation | num  | -1 to 1  | the average standard deviation of the magnitude of the frequency domain body acceleration
| 73 | frequency.body.acceleration.magnitude.meanfrequency | num  | -1 to 1  | the average mean frequency of the magnitude of the frequency domain body acceleration
| 74 | frequency.body.body.acceleration.jerk.magnitude.mean | num  | -1 to 1  | the average mean of the magnitude of the frequency domain body acceleration jerk
| 75 | frequency.body.body.acceleration.jerk.magnitude.standarddeviation | num  | -1 to 1  | the average standard deviation of the magnitude of the frequency domain body acceleration jerk
| 76 | frequency.body.body.acceleration.jerk.magnitude.meanfrequency | num  | -1 to 1  | the average mean frequency of the magnitude of the frequency domain body acceleration jerk
| 77 | frequency.body.gyroscope.magnitude.mean | num  | -1 to 1  | the average mean of the magnitude of the frequency domain body angular velocity
| 78 | frequency.body.gyroscope.magnitude.standarddeviation | num  | -1 to 1  | the average standard deviation of the magnitude of the frequency domain body angular velocity
| 79 | frequency.body.gyroscope.magnitude.meanfrequency | num  | -1 to 1  | the average mean frequency of the magnitude of the frequency domain body angular velocity
| 80 | frequency.body.gyroscope.jerk.magnitude.mean | num  | -1 to 1  | the average mean of the magnitude of the frequency domain body angular velocity jerk
| 81 | frequency.body.gyroscope.jerk.magnitude.standarddeviation | num  | -1 to 1  | the average standard deviation of the magnitude of the frequency domain body angular velocity jerk
| 82 | frequency.body.gyroscope.jerk.magnitude.meanfrequency | num  | -1 to 1  | the average mean frequency of the magnitude of the frequency domain body angular velocity jerk
