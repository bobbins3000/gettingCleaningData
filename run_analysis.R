## Set working directory to where the data is 
setwd("C:/Users/Dan & Rach/Desktop/Data Science/Getting & Cleaning/UCI HAR Dataset")

## Read in features to help reading in the other datasets ---> feat
feat = read.table("features.txt")
feat

## Read in the test/X_test file from .txt format ---> testRaw
testRaw = read.table("test/X_test.txt")

## Read in the train/X_train file from .txt format ----> trainRaw
trainRaw = read.table("train/X_train.txt")

## Merge data to add testRaw data to the bottom of trainRaw ---> dataRaw
dataRaw <- rbind(trainRaw, testRaw)

## Retain only the columns from dataRaw to retain only the mean & SD columns ---> rawMeanSD
## Columns to keep defined from the feat data frame
rawMeanSD <- dataRaw[,c("V1","V2","V3","V4","V5","V6","V41","V42","V43","V44","V45","V46",
  "V81","V82","V83","V84","V85","V86","V121","V122","V123","V124","V125","V126","V161","V162",
  "V163","V164","V165","V166","V201","V202","V214","V215","V227","V228","V240","V241","V253",
  "V254","V266","V267","V268","V269","V270","V271","V345","V346","V347","V348","V349","V350",
  "V424","V425","V426","V427","V428","V429","V503","V504","V516","V517","V529","V530","V542","V543")]

## Read in activity info for test, renaming the column ---> testActivity
testActivity = read.table("test/y_test.txt",col.names = c("Activity"))

## Read in activity info for train, renaming the column ---> trainActivity
trainActivity = read.table("train/y_train.txt",col.names = c("Activity"))

## Add activity data column (testActivity & trainActivity) to rawMeanSD ---> actMeanSD
actMeanSD <- cbind(rawMeanSD,rbind(trainActivity,testActivity))

## Read in activity labels ---> activityLabel
activityLabel = read.table("activity_labels.txt")
activityLabel

## Rename activities from a 1-6 value to the labels from the activityLabel data frame
actMeanSD$Activity <- as.character(actMeanSD$Activity)
actMeanSD$Activity[actMeanSD$Activity == "1"] <- "WALKING"
actMeanSD$Activity[actMeanSD$Activity == "2"] <- "WALKING_UPSTAIRS"
actMeanSD$Activity[actMeanSD$Activity == "3"] <- "WALKING_DOWNSTAIRS"
actMeanSD$Activity[actMeanSD$Activity == "4"] <- "SITTING"
actMeanSD$Activity[actMeanSD$Activity == "5"] <- "STANDING"
actMeanSD$Activity[actMeanSD$Activity == "6"] <- "LAYING"

## Label the dataset with appropriate column labels
names(actMeanSD) <- c("tBodyAcc x-axis mean","tBodyAcc y-axis mean","tBodyAcc z-axis mean",
  "tBodyAcc x-axis standard deviation","tBodyAcc y-axis standard deviation",
  "tBodyAcc z-axis standard deviation","tGravityAcc x-axis mean","tGravityAcc y-axis mean",
  "tGravityAcc z-axis mean","tGravityAcc x-axis standard deviation",
  "tGravityAcc y-axis standard deviation","tGravityAcc z-axis standard deviation",
  "tBodyAccJerk x-axis mean","tBodyAccJerk y-axis mean","tBodyAccJerk z-axis mean",
  "tBodyAccJerk x-axis standard deviation","tBodyAccJerk y-axis standard deviation",
  "tBodyAccJerk z-axis standard deviation","tBodyGyro x-axis mean","tBodyGyro y-axis mean",
  "tBodyGyro z-axis mean","tBodyGyro x-axis standard deviation","tBodyGyro y-axis standard deviation",
  "tBodyGyro z-axis standard deviation","tBodyGyroJerk x-axis mean","tBodyGyroJerk y-axis mean",
  "tBodyGyroJerk z-axis mean","tBodyGyroJerk x-axis standard deviation",
  "tBodyGyroJerk y-axis standard deviation","tBodyGyroJerk z-axis standard deviation",
  "tBodyAccMag mean","tBodyAccMag standard deviation","tGravityAccMag mean",
  "tGravityAccMag standard deviation","tBodyAccJerkMag mean","tBodyAccJerkMag standard deviation",
  "tBodyGyroMag mean","tBodyGyroMag standard deviation","tBodyGyroJerkMag mean",
  "tBodyGyroJerkMag standard deviation","fBodyAcc x-axis mean","fBodyAcc y-axis mean",
  "fBodyAcc z-axis mean","fBodyAcc x-axis standard deviation","fBodyAcc y-axis standard deviation",
  "fBodyAcc z-axis standard deviation","fBodyAcc x-axis mean","fBodyAcc y-axis mean",
  "fBodyAcc z-axis mean","fBodyAcc x-axis standard deviation","fBodyAcc y-axis standard deviation",
  "fBodyAcc z-axis standard deviation","fBodyAcc x-axis mean","fBodyAcc y-axis mean",
  "fBodyAcc z-axis mean","fBodyAcc x-axis standard deviation","fBodyAcc y-axis standard deviation",
  "fBodyAcc z-axis standard deviation","fBodyAccMag mean","fBodyAccMag standard deviation",
  "fBodyBodyAccJerkMag mean","fBodyBodyAccJerkMag standard deviation","fBodyBodyGyroMag mean",
  "fBodyBodyGyroMag standard deviation","fBodyBodyGyroJerkMag mean",
  "fBodyBodyGyroJerkMag standard deviation","Activity")

## Read in subject info for test ---> testSubject
testSubject = read.table("test/subject_test.txt",col.names = c("Subject"))

## Read in subject info for train ---> trainSubject
trainSubject = read.table("train/subject_train.txt",col.names = c("Subject"))

## Add subject data column ---> fullData
fullData <- cbind(actMeanSD,rbind(trainSubject,testSubject))

## Melt the data frame to focus on activity and subject 
library(plyr)
library(reshape2)
dataMelt <- melt(fullData,id=c("Activity","Subject"),
  measure.vars=c("tBodyAcc x-axis mean","tBodyAcc y-axis mean","tBodyAcc z-axis mean",
  "tBodyAcc x-axis standard deviation","tBodyAcc y-axis standard deviation",
  "tBodyAcc z-axis standard deviation","tGravityAcc x-axis mean","tGravityAcc y-axis mean",
  "tGravityAcc z-axis mean","tGravityAcc x-axis standard deviation",
  "tGravityAcc y-axis standard deviation","tGravityAcc z-axis standard deviation",
  "tBodyAccJerk x-axis mean","tBodyAccJerk y-axis mean","tBodyAccJerk z-axis mean",
  "tBodyAccJerk x-axis standard deviation","tBodyAccJerk y-axis standard deviation",
  "tBodyAccJerk z-axis standard deviation","tBodyGyro x-axis mean","tBodyGyro y-axis mean",
  "tBodyGyro z-axis mean","tBodyGyro x-axis standard deviation","tBodyGyro y-axis standard deviation",
  "tBodyGyro z-axis standard deviation","tBodyGyroJerk x-axis mean","tBodyGyroJerk y-axis mean",
  "tBodyGyroJerk z-axis mean","tBodyGyroJerk x-axis standard deviation",
  "tBodyGyroJerk y-axis standard deviation","tBodyGyroJerk z-axis standard deviation",
  "tBodyAccMag mean","tBodyAccMag standard deviation","tGravityAccMag mean",
  "tGravityAccMag standard deviation","tBodyAccJerkMag mean","tBodyAccJerkMag standard deviation",
  "tBodyGyroMag mean","tBodyGyroMag standard deviation","tBodyGyroJerkMag mean",
  "tBodyGyroJerkMag standard deviation","fBodyAcc x-axis mean","fBodyAcc y-axis mean",
  "fBodyAcc z-axis mean","fBodyAcc x-axis standard deviation","fBodyAcc y-axis standard deviation",
  "fBodyAcc z-axis standard deviation","fBodyAcc x-axis mean","fBodyAcc y-axis mean",
  "fBodyAcc z-axis mean","fBodyAcc x-axis standard deviation","fBodyAcc y-axis standard deviation",
  "fBodyAcc z-axis standard deviation","fBodyAcc x-axis mean","fBodyAcc y-axis mean",
  "fBodyAcc z-axis mean","fBodyAcc x-axis standard deviation","fBodyAcc y-axis standard deviation",
  "fBodyAcc z-axis standard deviation","fBodyAccMag mean","fBodyAccMag standard deviation",
  "fBodyBodyAccJerkMag mean","fBodyBodyAccJerkMag standard deviation","fBodyBodyGyroMag mean",
  "fBodyBodyGyroMag standard deviation","fBodyBodyGyroJerkMag mean",
  "fBodyBodyGyroJerkMag standard deviation"))

## Create new dataset with average mean & average SD per activity ---> summaryData
summaryData <- ddply(dataMelt,.(Activity,Subject,variable),summarise,mean=mean(value))

## Write out this dataset using write.table()
write.table(summaryData, 
  file="C:/Users/Dan & Rach/Desktop/Data Science/Getting & Cleaning/UCI HAR Dataset/summaryData.txt", 
  row.names=FALSE)
