## Code Book For Course Project Week 3


A code book  describing each variable and its values in the tidy data set (including units)


### Variables

Each variable exists in two kinds: mean and std. All varibles are normalized into the
range of [-1..1]. This are the variables:

1. subject (number in the range of 1..30)
2. acitivity_name (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
1. tBodyAccMag_...
2. tGravityAccMag_...
3. tBodyAccJerkMag_...
4. tBodyGyroMag_...
5. tBodyGyroJerkMag_...
6. fBodyAccMag_...
7. fBodyBodyAccJerkMag_...
8. fBodyBodyGyroMag_...
9. fBodyBodyGyroJerkMag_...


### Summary Choices

From the above variables was the mean taken. Each row shows the mean of the variables
for one subject and an activity (-name).


### Study design

The data was retrieved from the course website as a zip file. It was extracted and
the text data was read with the read.table function.

We excluded all the Inertial Signal files, because the data in the train and test
files contain the processed data from these raw files.

