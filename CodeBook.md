## Project Description
This is project for "Getting and Cleaning Data" course on Coursera. The purpose of this project is to demonstrate ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

##Collection of the raw data
Raw data can be downloaded from this link on https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

##Creating the tidy datafile

###Guide to create the tidy data file
To create tidy data set you need to:
1. Download the data from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. Extract downloaded zip file: getdata-projectfiles-UCI HAR Dataset.zip
3. Run "run_analysis.R" R script. The script has to be in the same folder as folder "UCI HAR Dataset" that was extracted in previous step.

###Cleaning of the data
The raw data is processed in following steps:
1. Raw data is loaded from the following files:
  * UCI HAR Dataset/train/X_train.txt
  * UCI HAR Dataset/train/y_train.txt
  * UCI HAR Dataset/train/subject_train.txt
  * UCI HAR Dataset/test/X_test.txt
  * UCI HAR Dataset/test/y_test.txt
  * UCI HAR Dataset/test/subject_test.txt
  * UCI HAR Dataset/features.txt
  * UCI HAR Dataset/activity_labels.txt
2. All this data is combined into single data frame
  * X_train and X_text are binded row-wise. Only the features that are the mean and standard deviation for each measurement are extraceted. They are denoted by "mean()" and "std()" substrings in their name.
  * y_train and y_text are binded row-wise
  * subject_train and subject_text are binded row-wise
  * all three data frames created in previous step are binded column-wise
  * Resulting data frame is merged with activity_labels data frame. Activity id is removed from the data frame.
3. Data frame created in previous stem is summarized in a way that it was gouped by activityName and subjectId. For all features mean value is calculated.

##Description of the variables
Tidy data set contains 180 rows and 68 columns. Each row represents data for particular subject doing particular activity and each column represents a variable. All variables exept subjectId and activityName represents mean value of a feature of interest present in original data.

The features come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). These signals were used to estimate variables of the feature vector for each pattern: '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation

subjectId represents subject that was performing task. activityName represents the activity that was perfomed by subject.

