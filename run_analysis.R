library(plyr)
library(dplyr)

# Step 1: Merge test and training data in one data set

test_data = read.table("test/X_test.txt")

train_data = read.table("train/X_train.txt")

raw_feature_data <- rbind(test_data, train_data)


# Step 2:  Select the vars with mean and stddev
data <- select(raw_feature_data, c(V201:V202, V214:V215, V227:V228, V240:V241, V253:V254, 
                                   V503:V504, V516:V517, V529:V530, V542:V543))

test_labels = read.table('test/y_test.txt')
train_labels = read.table('train/y_train.txt')

data$activity <- c(test_labels[,1], train_labels[,1])


test_subject = read.table('test/subject_test.txt')
train_subject = read.table('train/subject_train.txt')

data$subject <- c(test_subject[,1], train_subject[,1])


# Step  3: Uses descriptive activity names
activity_labels = read.table('activity_labels.txt')
activity_labels <- select(activity_labels, activity=V1, activity_name=V2)

data <- join(data, activity_labels)


# Step 4: Appropriately labels the data set with descriptive variable names

names <- c('tBodyAccMag_mean', 'tBodyAccMag_std', 'tGravityAccMag_mean','tGravityAccMag_std',  
           'tBodyAccJerkMag_mean', 'tBodyAccJerkMag_std', 'tBodyGyroMag_mean', 'tBodyGyroMag_std', 
           'tBodyGyroJerkMag_mean', 'tBodyGyroJerkMag_std', 'fBodyAccMag_mean', 'fBodyAccMag_std',
           'fBodyBodyAccJerkMag_mean', 'fBodyBodyAccJerkMag_std', 'fBodyBodyGyroMag_mean', 'fBodyBodyGyroMag_std',
           'fBodyBodyGyroJerkMag_mean', 'fBodyBodyGyroJerkMag_std', 
           'activity', 'subject', 'activity_name')

colnames(data) <- names


# Step 5: Average (mean) of each variable for each activity and each subject

data <- ddply(data, .(subject, activity_name), summarize, 
              tBodyAccMag_mean=mean(tBodyAccMag_mean), tBodyAccMag_std=mean(tBodyAccMag_std),
              tGravityAccMag_mean=mean(tGravityAccMag_mean), tGravityAccMag_std=mean(tGravityAccMag_std),
              tBodyAccJerkMag_mean=mean(tBodyAccJerkMag_mean), tBodyAccJerkMag_std=mean(tBodyAccJerkMag_std),
              tBodyGyroMag_mean=mean(tBodyGyroMag_mean), tBodyGyroMag_std=mean(tBodyGyroMag_std),
              tBodyGyroJerkMag_mean=mean(tBodyGyroJerkMag_mean), tBodyGyroJerkMag_std=mean(tBodyGyroJerkMag_std),
              fBodyAccMag_mean=mean(fBodyAccMag_mean), fBodyAccMag_std=mean(fBodyAccMag_std),
              fBodyBodyAccJerkMag_mean=mean(fBodyBodyAccJerkMag_mean), fBodyBodyAccJerkMag_std=mean(fBodyBodyAccJerkMag_std),
              fBodyBodyGyroMag_mean=mean(fBodyBodyGyroMag_mean), fBodyBodyGyroMag_std=mean(fBodyBodyGyroMag_std),
              fBodyBodyGyroJerkMag_mean=mean(fBodyBodyGyroJerkMag_mean), fBodyBodyGyroJerkMag_std=mean(fBodyBodyGyroJerkMag_std))


