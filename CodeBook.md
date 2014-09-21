---
title: "Getting and Cleaning Data Course Project Codebook"
author: "Pavel Rebov"
date: "22 September, 2014"
output: html_document
---

The experiment has been carried out that involved 30 volunteers performing six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, researchers captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

Following transformation has been performed on this data:

1. Measurements, Activity identificators and Subject identificators were merged into a single data set using `rbind` and `cbind` functions.
2. Column names were given meaningful names as indicated in corresponding **features.txt** data set.
3. Data set was subset using `grepl` to only include measurements on the mean and standard deviation for each measurement. Mean Frequencies were ommited since they represent not the measurement, but the rate at which they were taken.
4. Activity IDs were replaced with factor variable labeled with Activity names as indicated in **activity_labels.txt** data set.
5. `ddply` and `colMeans` were used to create a resulting tidy data set containing means of each variable for each activity and each subject.
6. Data set was saved using `write.csv` with `row.names = FALSE`

### tidydata.txt
Comma-separated CSV file containing 180 observations of 68 variables.

* Subject                    : int
* Activity                   : Factor w/ 6 levels
* tBodyAcc-mean()-X          : num
* tBodyAcc-mean()-Y          : num
* tBodyAcc-mean()-Z          : num
* tBodyAcc-std()-X           : num
* tBodyAcc-std()-Y           : num
* tBodyAcc-std()-Z           : num
* tGravityAcc-mean()-X       : num
* tGravityAcc-mean()-Y       : num
* tGravityAcc-mean()-Z       : num
* tGravityAcc-std()-X        : num
* tGravityAcc-std()-Y        : num
* tGravityAcc-std()-Z        : num
* tBodyAccJerk-mean()-X      : num
* tBodyAccJerk-mean()-Y      : num
* tBodyAccJerk-mean()-Z      : num
* tBodyAccJerk-std()-X       : num
* tBodyAccJerk-std()-Y       : num
* tBodyAccJerk-std()-Z       : num
* tBodyGyro-mean()-X         : num
* tBodyGyro-mean()-Y         : num
* tBodyGyro-mean()-Z         : num
* tBodyGyro-std()-X          : num
* tBodyGyro-std()-Y          : num
* tBodyGyro-std()-Z          : num
* tBodyGyroJerk-mean()-X     : num
* tBodyGyroJerk-mean()-Y     : num
* tBodyGyroJerk-mean()-Z     : num
* tBodyGyroJerk-std()-X      : num
* tBodyGyroJerk-std()-Y      : num
* tBodyGyroJerk-std()-Z      : num
* tBodyAccMag-mean()         : num
* tBodyAccMag-std()          : num
* tGravityAccMag-mean()      : num
* tGravityAccMag-std()       : num
* tBodyAccJerkMag-mean()     : num
* tBodyAccJerkMag-std()      : num
* tBodyGyroMag-mean()        : num
* tBodyGyroMag-std()         : num
* tBodyGyroJerkMag-mean()    : num
* tBodyGyroJerkMag-std()     : num
* fBodyAcc-mean()-X          : num
* fBodyAcc-mean()-Y          : num
* fBodyAcc-mean()-Z          : num
* fBodyAcc-std()-X           : num
* fBodyAcc-std()-Y           : num
* fBodyAcc-std()-Z           : num
* fBodyAccJerk-mean()-X      : num
* fBodyAccJerk-mean()-Y      : num
* fBodyAccJerk-mean()-Z      : num
* fBodyAccJerk-std()-X       : num
* fBodyAccJerk-std()-Y       : num
* fBodyAccJerk-std()-Z       : num
* fBodyGyro-mean()-X         : num
* fBodyGyro-mean()-Y         : num
* fBodyGyro-mean()-Z         : num
* fBodyGyro-std()-X          : num
* fBodyGyro-std()-Y          : num
* fBodyGyro-std()-Z          : num
* fBodyAccMag-mean()         : num
* fBodyAccMag-std()          : num
* fBodyBodyAccJerkMag-mean() : num
* fBodyBodyAccJerkMag-std()  : num
* fBodyBodyGyroMag-mean()    : num
* fBodyBodyGyroMag-std()     : num
* fBodyBodyGyroJerkMag-mean(): num
* fBodyBodyGyroJerkMag-std() : num