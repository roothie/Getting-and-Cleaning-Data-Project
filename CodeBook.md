# Getting and Cleaning Data Course Project

## Source Data
The [source data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) is comprised of [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) data collected by accelerometers from the Samsung Galaxy S smart phones worn by test subjects as they exercised.

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

### Attribute Information:

For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

### Activity Labels

* `WALKING` (value `1`): subject was walking during the test
* `WALKING_UPSTAIRS` (value `2`): subject was walking up a staircase during the test
* `WALKING_DOWNSTAIRS` (value `3`): subject was walking down a staircase during the test
* `SITTING` (value `4`): subject was sitting during the test
* `STANDING` (value `5`): subject was standing during the test
* `LAYING` (value `6`): subject was laying down during the test

## Script Overview

The script 'run_analysis.R' performs the 5 steps described in project's instruction.

* Similar data is merged using the `rbind()` function. Data is defined as similiar if the files have the same number of columns and referring to the same entities according to the data source documentation
* The mean and standard deviation for those columns are then calculated, column names corrected as identified in 'features.txt' file.
* As activity data is then cleaned according to the names and IDs from  'activity_labels.txt' and substitued in the dataset.
* Vague column names are then given more clear names.
* The final step is to create a new dataset with all the average measures for each subject and activity type. 
* Script output file is 'tidy_averages.txt', which is included in the repository.

### Variables
* Data from downloaded files:  'xTrainData', 'yTrainData', 'xTrainData', 'yTrainData', 'subjectTrainData', and 'subjectTrainData' 
* Used to merge prior datasets: 'xData', 'yData', and 'subjectData'
* 'featuresData' contains the correct names for the 'xData' dataset, which are applied to the column names stored in 'fCols'
* A similar approach is taken with activity names through the 'activitiesData' variable.
* 'allData' merges 'xData', 'yData', and 'subjectData'
* 'avgData' contains the averages which is then written to the output file


### Activity Labels

* `WALKING` (value `1`): subject was walking during the test
* `WALKING_UPSTAIRS` (value `2`): subject was walking up a staircase during the test
* `WALKING_DOWNSTAIRS` (value `3`): subject was walking down a staircase during the test
* `SITTING` (value `4`): subject was sitting during the test
* `STANDING` (value `5`): subject was standing during the test
* `LAYING` (value `6`): subject was laying down during the test
