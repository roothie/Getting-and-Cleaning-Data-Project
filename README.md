# Getting and Cleaning Data - Course Project

Course project for the "Getting and Cleaning Data" Coursera course.  The raw data set is made up of [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) data collected by accelerometers from the Samsung Galaxy S smart phone. 

## Course Project Files
### File List
* 'run_analysis.R' - script that process the raw dataset into a tidy dataset
* 'CodeBook.md' - describes all the variables and summaries calculated, along with units, and any other relevant information.
* 'tidy_averages.txt' - the output of step 5

### Assumptions
1. The raw dataset is already downloaded and extracted to a subdirectory "UCI HAR Dataset" located in the same directory as the script.
2.  The raw dataset files' names have not been altered.

### 'run_analysis.R' Steps
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.