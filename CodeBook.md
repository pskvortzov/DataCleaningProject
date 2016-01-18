##Project Description
This is the Course Project for the "Getting and Cleaning Data" course. The goal of the project is to prepare tidy data that can be used for later analysis.

##Study design and data processing

###Collection of the raw data
In this project we're using the Human Activity Recognition Using Smartphones Data Set. You can get this dataset [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

##Creating the tidy datafile

###Guide to create the tidy data file
1. Download the raw data
2. Place the raw data in the "data" folder next to the "run_analysis.R" script
3. Run the script
4. You should get a file named "tidy_data.txt" that contains the tidy data
  
###Cleaning of the data
This script loads the training and test data sets with activity and subject data and combines it into one data set. After that it extracts only the measurements on the mean and standard deviation for each measurement. The resulting data is used to create a tidy data set that contains the average of each variable grouped by activity and subject. 

##Description of the variables in the tidy_data.txt file
The resulting tidy data set contains 180 rows and 68 columns. Each row contains the average of each variable for each combination of activity and subject (6 activities and 30 subjects). The columns labeled "activity" and "subject" contain respectively the label of the activity ("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING" or "LAYING") and the test subject number (numbers from 1 to 30). The columns 3 to 68 contain the average of each variable grouped by activity and subject. The name of each variable is constructed using the following schema: average.(VariableName).(Type).(Axis)

- VariableName indicates the type of raw signal captured from the accelerometer and gyroscope. It is prefixed with either "t" or "f". The prefix "t" denotes "time" to indicate that the original data were captured at a constant rate of 50 Hz. The prefix "f" denotes that a Fast Fourier Transform was applied to the original signal. 
- Type indicates whether the variable contains the mean value ("mean") or the standard deviation ("std") of the raw signal.
- Axis indicates the axis of the collected signal in some of the variables.

##Sources
[Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
