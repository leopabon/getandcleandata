## Getting and Cleaning Data Course
## Course Project
##
## 1) Merges the training and the test sets to create one data set.
## 2) Extracts only the measurements on the mean and standard deviation for each
## measurement.
## 3) Uses descriptive activity names to name the activities in the data set
## 4) Appropriately labels the data set with descriptive variable names.
## 5) Creates a second, independent tidy data set with the average of each
## variable for each activity and each subject. 

library(plyr)

## Create a index of the features realated to mean and std.
##
## It only considers the functions with -mean(), -meanFreq(), -std() as part of
## its name as in fBodyGyro-std()-X. 
##
## Does not consider features with mean inside the function angle as is not
## clear what it does.
features <- read.table("./features.txt", header=FALSE)
indexMeanStd <- c(grep("mean|std", features[[2]]))

## Load test data related to mean and std features
testData <- read.table("./X_test.txt", header=FALSE)
testData <- testData[, indexMeanStd]
testSubject <- read.table("./subject_test.txt", header=FALSE, col.names="Subject")
testActivity <- read.table("./y_test.txt", header=FALSE, col.names="Activity.Id")
test <- cbind.data.frame(testSubject, testActivity, testData)

## Load training data related to mean and std features
trainData <- read.table("./X_train.txt", header=FALSE)
trainData <- trainData[, indexMeanStd]
trainSubject <- read.table("./subject_train.txt", header=FALSE, col.names="Subject")
trainActivity <- read.table("./y_train.txt", header=FALSE, col.names="Activity.Id")
train <- cbind.data.frame(trainSubject, trainActivity, trainData)

## Merge test and training data
samsung <- rbind.data.frame(test, train)

## Set descriptive activity names
activity <- data.frame(c(1:6), c("Walking", "Walking Upstairs", 
                                 "Walking Downstairs", "Sitting", "Standing",
                                 "Laying"))
colnames(activity) <- c("Activity.Id", "Activity")
samsung <- merge(activity, samsung, by.x="Activity.Id", by.y="Activity.Id")
samsung$Activity.Id = NULL

## Appropriately labels the data set with descriptive variable names
## This completes the dataset described in steps 1-4 of the project
features[,2] <- gsub("\\(\\)", "", features[,2])
features[,2] <- gsub("-", ".", features[,2])
colnames(samsung) = c("Activity", "Subject", features[indexMeanStd, 2])

## Creates a second, independent tidy data set with the average of each variable
## for each activity and each subject. 
samsungTidy <- ddply(samsung, .(Activity, Subject), numcolwise(mean))

rm(activity, features, test, testActivity, testData, testSubject, train,
   trainActivity, trainData, trainSubject, indexMeanStd)