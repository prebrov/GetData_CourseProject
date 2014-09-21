## Check if the data directory exists and create if it doesn't
if(!file.exists("./data")) {
    dir.create("./data")
}

## Download and unzip dataset
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
tempFile <- tempfile()
download.file(fileURL, tempFile, method = "curl")
unzip(tempFile, exdir = "./data")

## We'll now read all the data sets
testSubject <- read.table("./data/UCI HAR Dataset/test/subject_test.txt",
                          header = F, stringsAsFactors = F, fill = T)
testX <- read.table("./data/UCI HAR Dataset/test/X_test.txt",
                    header = F, stringsAsFactors = F, fill = T)
testY <- read.table("./data/UCI HAR Dataset/test/y_test.txt",
                    header = F, stringsAsFactors = F, fill = T)
trainSubject <- read.table("./data/UCI HAR Dataset/train/subject_train.txt",
                          header = F, stringsAsFactors = F, fill = T)
trainX <- read.table("./data/UCI HAR Dataset/train/X_train.txt",
                    header = F, stringsAsFactors = F, fill = T)
trainY <- read.table("./data/UCI HAR Dataset/train/y_train.txt",
                    header = F, stringsAsFactors = F, fill = T)

#### Merging the training and the test sets to create one data set. ####
mergedData <- cbind(rbind(testSubject, trainSubject),
                    rbind(testY, trainY),
                    rbind(testX, trainX))

## We'll also read the variables names from features.txt
features <- read.table("./data/UCI HAR Dataset/features.txt",
                       header = F, stringsAsFactors = F, fill = T)

## Set meaningful names for first columns, those from Subject and Y
colnames(mergedData)[1:2] <- c("Subject", "Activity")
## Set names for all other columns, those coming from X, according to features data frame
colnames(mergedData)[3:563] <- features[, 2]

## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

## Subset mergedData to only include columns that have "mean", "std", "Activity" or "Subject" and do NOT have "meanFreq" in their name
mergedData <- mergedData[, grepl("mean()|std()|Activity|Subject", colnames(mergedData)) & !grepl("meanFreq", colnames(mergedData))]

## To use descriptive activity names to name the activities in the data set
## Read activity names from activity_labels.txt
activities <- read.table("./data/UCI HAR Dataset/activity_labels.txt",
                       header = F, stringsAsFactors = F, fill = T)

## Appropriately label the data set with descriptive activity names.
mergedData$Activity <- factor(mergedData$Activity, levels = activities[, 1], labels = activities[, 2])


## Create a second, independent tidy data set with the average of each variable for each activity and each subject.
library(ddply)
tidyData <- ddply(mergedData,
                  .(Subject, Activity),
                  .fun=function(x) { colMeans(x[ ,-c(1:2)]) })

## Write out resulting tidy data set into CSV
write.csv(tidyData, "./data/tidydata.txt", row.names = FALSE)