# runAnalysis.r File Description:
# 
# The data linked to from the course website represent data collected from the accelerometers from
# the Samsung Galaxy S smartphone. Location of the datafile to be used: 
#  
#  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
#
# You should create one R script called run_analysis.R that does the following. 
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of
#    each variable for each activity and each subject.

library(plyr)
rm(list=ls())

# Step 1:  Merges the training and the test sets to create one data set
xTrainData <- read.table("./UCI HAR Dataset/train/X_train.txt")
yTrainData <- read.table("./UCI HAR Dataset/train/y_train.txt")
SubjectTrainData <- read.table("./UCI HAR Dataset/train/subject_train.txt")

xTestData <- read.table("./UCI HAR Dataset/test/X_test.txt")
yTestData <- read.table("./UCI HAR Dataset/test/y_test.txt")
subjectTestData <- read.table("./UCI HAR Dataset/test/subject_test.txt")

xData <- rbind(xTrainData, xTestData)
yData <- rbind(yTrainData, yTestData)
SubjectData <- rbind(SubjectTrainData, subjectTestData)

# Step 2:  Extracts only the measurements on the mean and standard deviation for each measurement
featuresData <- read.table("./UCI HAR Dataset/features.txt")
fCols <- grep("-(mean|std)\\(\\)", featuresData[, 2])
xData <- xData[, fCols]
names(xData) <- featuresData[fCols, 2]

# Step 3:  Uses descriptive activity names to name the activities in the data set
activitiesData <- read.table("./UCI HAR Dataset/activity_labels.txt")
yData[, 1] <- activitiesData[yData[, 1], 2]
names(yData) <- "activity"  

# Step 4
names(SubjectData) <- "subject"
allData <- cbind(xData, yData, SubjectData)

# Step 5
# Create a second, independent tidy data set with the average of each variable
# for each activity and each subject
###############################################################################
avgData <- ddply(allData, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(avgData, "./tidy_averages.txt", row.name=FALSE)