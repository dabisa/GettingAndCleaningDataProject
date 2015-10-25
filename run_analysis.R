library(dplyr)

# Load raw data

feature_names <- read.table("./UCI HAR Dataset/features.txt", col.names=c("fetureNo", "featureName"))[,"featureName"]
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", col.names=c("activityId", "activityName"))

X_train <- read.table("./UCI HAR Dataset/train/X_train.txt", col.names=feature_names)
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", col.names="activityId")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names="subjectId")

X_test <- read.table("./UCI HAR Dataset/test/X_test.txt", col.names=feature_names)
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", col.names="activityId")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names="subjectId")

# Merge the training and the test sets to create one data set.
# Only the measurements on the mean and standard deviation for each measurement.

y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)
X <- rbind(X_train, X_test)[,grepl("mean\\(\\)|std\\(\\)", feature_names)]

data <- cbind(y, subject, X)
data <- merge(data, activity_labels, by.x="activityId", by.y="activityId")
data <- data[,which(names(data)!="activityId")]

# Create tidy data set with the average of each variable for each activity and each subject

tidy_data <- summarize_each(group_by(data, subjectId, activityName), funs(mean))
write.csv(tidy_data, "tidy_data.csv", row.names=FALSE)
