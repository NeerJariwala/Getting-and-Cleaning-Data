##Read in x data
x_train_data <- read.table("UCI HAR Dataset/train/x_train.txt")
x_test_data <- read.table("UCI HAR Dataset/test/x_test.txt")

##Read in y data
y_train_data <- read.table("UCI HAR Dataset/train/y_train.txt")
y_test_data <- read.table("UCI HAR Dataset/test/y_test.txt")

##Read in subject data
subject_train_data <- read.table("UCI HAR Dataset/train/subject_train.txt")
subject_test_data <- read.table("UCI HAR Dataset/test/subject_test.txt")

##Read in features and activities
features <- read.table("UCI HAR Dataset/features.txt")
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")

##Assign column headers to x_train_data and x_test_data from features file
colnames(x_train_data) <- features[,2]
colnames(x_test_data) <- features[,2]

##Merge training and test sets into one variable
xdata <- rbind(x_train_data, x_test_data)
ydata <- rbind(y_train_data, y_test_data)
subjectdata <- rbind(subject_train_data, subject_test_data)

##Extracts the mean and standard deviation of each measurement
xdata_mean <- xdata[,grep("mean()",names(xdata),fixed=TRUE)]
xdata_std <- xdata[,grep("std()",names(xdata),fixed=TRUE)]
xdata <- cbind(xdata_mean,xdata_std)

##Add subjectid column
colnames(subjectdata) <- "subjectid"
xdata <- cbind(subjectdata,xdata)

##Replace numeric values in activity data with named values 
ydata <- data.frame(activity_labels$V2[match(ydata$V1,activity_labels$V1)])
colnames(ydata) = "activity"

##Add activity column
xdata <- cbind(ydata,xdata)

##Convert data into a data table
dtable <- data.table(xdata)

##Creates a second, independent tidy data set with the average of each variable for each activity and each subject
cleaned_data <- dtable[,lapply(.SD,mean),by=list(activity,subjectid)]

##Write data into a text file
write.table(cleaned_data, "cleaned_data.txt", row.name=FALSE)