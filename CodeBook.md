#CodeBook for John Hopkins: Getting & Cleaning Data Assignment
#Version 1.0

##Dan Kellett

##Study design:

The final summaryData.txt file was created from data collected by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto (Smartlab - Non Linear Complex Systems Laboratory).
The raw data can be found at: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The follow steps were undertaken to summarise the data:

1. Raw data was read in with the test and train data merged ontop of each other.
2. The columns in the data frame were restricted to ensure only variables relating to mean and standard deviation were retained. This decision was made by reviewing all features and manually selecting those appropriate
3. Activity data was appended to the data with appropriate labels applied.
4. Appropriate labels for the features selected were applied. These labels were based on a basic cleaning of the label data supplied.
5. Subject data was appended to the data as an extra column.
6. A data melt was applied to melt the data frame down to one row per subject, per activity, per feature (long data).
7. ddply was used to aggregate the data, calculating the mean per subject, per activity, per feature (long data).
8. The summary data was written out to a text file (summaryData.txt).


##Code book:

The following variables can be found in the file summaryData.txt -

###Activity:

  Activity undertaken during measurement. Falls into 6 categories: 
    WALKING 
    WALKING_UPSTAIRS
    WALKING_DOWNSTAIRS
    SITTING
    STANDING
    LAYING


###Subject:

	Indicator for subject in the experiment (runs from 1 to 30)

###variable:

	The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

	Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

	Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

	These signals were used to estimate variables of the feature vector for each pattern:  
	'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
	
	Features are normalized and bounded within [-1,1] prior to mean/standard deviation calculation.

	Only features relating to mean/standard deviation were analysed as per the scope. These features are:
		tBodyAcc x-axis mean
		tBodyAcc y-axis mean
		tBodyAcc z-axis mean
		tBodyAcc x-axis standard deviation
		tBodyAcc y-axis standard deviation
		tBodyAcc z-axis standard deviation
		tGravityAcc x-axis mean
		tGravityAcc y-axis mean
		tGravityAcc z-axis mean
		tGravityAcc x-axis standard deviation
		tGravityAcc y-axis standard deviation
		tGravityAcc z-axis standard deviation
		tBodyAccJerk x-axis mean
		tBodyAccJerk y-axis mean
		tBodyAccJerk z-axis mean
		tBodyAccJerk x-axis standard deviation
		tBodyAccJerk y-axis standard deviation
		tBodyAccJerk z-axis standard deviation
		tBodyGyro x-axis mean
		tBodyGyro y-axis mean
		tBodyGyro z-axis mean
		tBodyGyro x-axis standard deviation
		tBodyGyro y-axis standard deviation
		tBodyGyro z-axis standard deviation
		tBodyGyroJerk x-axis mean
		tBodyGyroJerk y-axis mean
		tBodyGyroJerk z-axis mean
		tBodyGyroJerk x-axis standard deviation
		tBodyGyroJerk y-axis standard deviation
		tBodyGyroJerk z-axis standard deviation
		tBodyAccMag mean
		tBodyAccMag standard deviation
		tGravityAccMag mean
		tGravityAccMag standard deviation
		tBodyAccJerkMag mean
		tBodyAccJerkMag standard deviation
		tBodyGyroMag mean
		tBodyGyroMag standard deviation
		tBodyGyroJerkMag mean
		tBodyGyroJerkMag standard deviation
		fBodyAcc x-axis mean
		fBodyAcc y-axis mean
		fBodyAcc z-axis mean
		fBodyAcc x-axis standard deviation
		fBodyAcc y-axis standard deviation
		fBodyAcc z-axis standard deviation
		fBodyAcc x-axis mean
		fBodyAcc y-axis mean
		fBodyAcc z-axis mean
		fBodyAcc x-axis standard deviation
		fBodyAcc y-axis standard deviation
		fBodyAcc z-axis standard deviation
		fBodyAcc x-axis mean
		fBodyAcc y-axis mean
		fBodyAcc z-axis mean
		fBodyAcc x-axis standard deviation
		fBodyAcc y-axis standard deviation
		fBodyAcc z-axis standard deviation
		fBodyAccMag mean
		fBodyAccMag standard deviation
		fBodyBodyAccJerkMag mean
		fBodyBodyAccJerkMag standard deviation
		fBodyBodyGyroMag mean
		fBodyBodyGyroMag standard deviation
		fBodyBodyGyroJerkMag mean
		fBodyBodyGyroJerkMag standard deviation


###mean: 	

	Calculated mean for all feature means and standard deviations split by Activity and Subject 	