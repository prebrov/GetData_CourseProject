GetData_CourseProject
=====================

Repositoty contains peer-assessed Coursera's Getting-and-Cleaning-Data Course Project.

David's project FAQ has been used as guidelines for the project. [1]

`run_analysis.R` is a script that performs the following:

1. Downloads data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
2. Unzips it into ./data directory
3. Each of the files for Subject, X and Y, both from test and train data sets is then read into its own data frame using `read.csv`
4. All data frames are merged using `rbind` to combine test and train datasets and `cbind` to combine Subject, Activity and Measurements.
5. Column are given meaningful names using hard-coded values for *Subject* and *Activity* and those read programmatically from **features.txt** data set. [2]
6. Using `grepl` finds all column names containing "mean" or "std". I am excluding columns containing "meanFreq" since functionaly it isn't a measurement of the data from the sensors, but a rate of measurement.
7. Reads IDs and names of activities from **activity_labels.txt** and uses `factor` to convert activity ids in the dataset to descriptive names of activities. Activity IDs are used as factor levels and activity names are used as labels.
8. Uses `ddply` to create a second data set with the average of each variable for each activity and each subject. Data is split by variables *Subject* and *Activity*, `colMeans` are used to calculate means on all columns except first two (Subject and Activity).
9. Uses `write.csv` to save the final tidy dataset as a CSV file names ./data/tidydata.txt. File can be read back with `read.csv("./data/tidydata.txt")`

#### References:

[1] https://class.coursera.org/getdata-007/forum/thread?thread_id=49

[2] https://class.coursera.org/getdata-007/forum/thread?thread_id=99#post-442