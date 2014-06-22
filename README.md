# Course Project
========================================================

The run_analysis.R script was made according to the Course Project instructions for the Getting and Cleaning Data course.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

The instructions are also avaiable on the following URL.

* https://class.coursera.org/getdata-004/human_grading/view/courses/972137/assessments/3/submissions

## Before Executing

This script assumes that the Samsung files are on the working directory. The files can be obttained at the following URL:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should unzip it and copy the following files to the working directory:

* features.txt
* test/subject_test.txt
* test/X_test.txt
* test/y_test.txt
* train/subject_train.txt
* train/X_train.txt
* train/y_train.txt

The final output of the script is the tidy data set described in step 5 of the project instructions. It will be saved on the file tidy.txt on the working directory. Its format and data are described on CodeBook.md file.

## Processing instructions

Each type of data (train and test) has 3 files that contains data needed for this project.

* subject_train.txt / subject_test.txt: Subject responsible for that observation measured.
* y_train.txt / y_test.txt: Activity perfomed on the observation measured.
* X_train.txt / X_test.txt: 561 features measured on the observation.

Each line of these files represent one observation measured. So, the first step was to load the 3 files and combine then on a single data frame with cbind. This procedure was performed twice, one time for test data, and another for train data.

The project requires to output only features related to mean and std measures. So, I found to be easier to do that during the processing step above. I only selected features with "-mean()", "-meanFreq()", or "-std()" as in "fBodyGyro-std()-X". I did not considered names with mean inside the angle feature as it is not clear what it does. These 3 terms were used to scan and select the names one the features file.

* features.txt: Contains the features names for the measures provided on the "X_train.txt" and "X_test.txt" files.

For the purposes of this project, the train and the test data sets were considerated one thing. They probably are used first to train and after that to test an algorithm or some prediction model. It has no mean to separate a dimension to identify test and train data. So, the next step was to append test to train data. This was perfomed with rbind.

After that, I used the 6 activities names to better describe the data related with the "y_train.txt" and "y_test.txt". This procedure used the merge function.

Then, I labeled the colunms related to "X_train.txt" and "X_test.txt" files. For that, I first cleaned the names on features.txt, than used colnames to assign then to the data set.

Finally, I summarized the data set with the average of each feature for each activity and subject. This data set is saved on the "tidy.txt" file on the working directory.