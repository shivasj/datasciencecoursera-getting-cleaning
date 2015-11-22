# Getting and Cleaning Data - Course Assigment
We will consume raw data and use R to create tidy data. 
A full description of the data we use is available at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Files in this repo
* README.md
* CodeBook.md
* run_analysis.R
* All the data files extracted from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## R script called run_analysis.R does the following. 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The output tidy file is created in the same working directory and is called tidy_data.txt

## run_analysis.R does the following

* Initial Step:
  * Read all the data from files
    * Test
    * Train
    * Features
    * Activity

* Step 1:
  * Merge the training and the test sets to create one data set called merged_data

* Step 2:
  * Extract the mean and standard deviation features into mean_std_features
  * Extract only the measurements for mean and standard deviation into mean_std_data

* Step 3:
  * Use the activity labels from activity_labels to give our mean_std_data actual column labels
  
* Step 4:
  * Apply meaningful column names to the data set mean_std_data
  
* Step 5:
  * Use the aggregate function to find the average of each activity and subject
  
* Final Output:
  * Write the new tidy set into a text file called tidy2.txt, formatted similarly to the original files.
