---
title: "CodeBook"
output: html_document
---

# The information below comes from the features_info and README files for the UCI HAR Dataset.

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012


# Variable details
Variable  | Description
------------- | -------------
x_test_data  | Holds the data contained in the x_test file.
x_train_data  | Holds the data contained in the x_train file.
y_test_data | Holds the data contained in the y_test file.
y_train_data | Holds the data contained in the y_train file.
subject_test_data | Holds the data contained in the subject_test file.
subject_train_date | Holds the data contained in the subject_test file.
features | Holds the information from the features file.
activity_labels | Holds the 6 different activities preformed.
xdata | Merged data set containing the x training and test sets.
ydata | Merged data set containing the y training and test sets.
subjectdata | Merged data set containing the subject training and test sets.
xdata_mean | Mean measurements from the x data set.
xdata_std | Standard Deviation measurements from the x data set.
dtable | Data table containing the cleaned data.
cleaned_data | Tidy data set with the average of each variable for each activity and each subject.


# Processing steps

1) Read in all data from the given data set.
2) Assign column headers to the x train and test data files using the features file.
3) Merge the training and test sets into one data set
4) Extract the mean and strandard deviation for each measuremant and add it to the merged data set.
5) Add a column for SubjectID.
6) Add a column for the activity with approiate names.
7) Convert the data set into a data table
8) Create a tidy data set with the average of each variable for each activity and each subject.
9) Write the table to a text file.