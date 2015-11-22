## Set working Directory
setwd("/Sync/Development/Git Forks/datasciencecoursera-getting-cleaning")

## Library
#library(dplyr)

## Read data from files
# Test
y_test <- read.table("test/y_test.txt", quote="\"",col.names="label")
subject_test <- read.table("test/subject_test.txt", col.names="subject")
X_test <- read.table("test/X_test.txt", quote="\"")
# Train
y_train <- read.table("train/y_train.txt", quote="\"",col.names="label")
subject_train <- read.table("train/subject_train.txt", col.names="subject")
X_train <- read.table("train/X_train.txt", quote="\"")
# Features
features <- read.table("features.txt", strip.white=TRUE, stringsAsFactors=FALSE,col.names = c("id","feature"))
# Activities
activity_labels <- read.table("activity_labels.txt", stringsAsFactors=FALSE)

## 1. Merges the training and the test sets to create one data set.
test <- cbind(subject_test, y_test, X_test)
train <- cbind(subject_train, y_train, X_train)
merged_data <- rbind(test,train)

## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
mean_std_features <- features[grep("mean\\(\\)|std\\(\\)", features$feature), ]
# increment by 2 because data has subjects and labels in the beginning
mean_std_data <- merged_data[, c(1, 2, features_ext$id+2)]

## 3. Uses descriptive activity names to name the activities in the data set
mean_std_data$label <- activity_labels[mean_std_data$label, 2]

## 4. Appropriately labels the data set with descriptive variable names. 
column_names <- c("subject", "label", mean_std_features$feature)
# Clean up the columns names
column_names <- tolower(gsub("[^[:alpha:]]", "", column_names))
# Assign the column names to our dataset
colnames(mean_std_data) <- column_names

## 5. From the data set in step 4, creates a second, independent tidy data set with the average 
## of each variable for each activity and each subject.
tidy_data <- aggregate(mean_std_data[, 3:ncol(mean_std_data)],by=list(subject = mean_std_data$subject,label = mean_std_data$label),mean)

## Write the data to a file for upload for course assignment
write.table(format(tidy_data, scientific=T), "tidy_data.txt",row.names=FALSE, col.names=FALSE, quote=2)

  
  