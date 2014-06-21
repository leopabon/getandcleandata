#Course Project
##Getting and Cleaning Data
========================================================

The script assumes that the Samsung files are on the working directory.

The Samsung files can be obttained at the following URL:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should unzip it and copy the following files to the working directory:

features.txt
test/subject_test.txt
test/X_test.txt
test/y_test.txt
train/subject_train.txt
train/X_train.txt
train/y_train.txt

After the executing the script, two data.frames will be avaiable:

samsung      -  Data Frame with the solution to steps 1-4.
samsungTidy  -  Tidy data frame with the variable means for each existing 
                subject and activity.
                
The description for the data on both data frames is provided on codebook file.






