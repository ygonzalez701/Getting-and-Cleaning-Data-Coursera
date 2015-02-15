setwd("C:/Users/Yago/Documents/Statistical Studies/The Data Science Track/Getting and Cleaning Data/Project/")

##Merges the TRAINING dataset from 3 individual files
training<-read.table("UCI HAR Dataset/train/X_train.txt")
training[,562] = read.table("UCI HAR Dataset/train/Y_train.txt")
training[,563] = read.table("UCI HAR Dataset/train/subject_train.txt")

##Merges the TESTING dataset from 3 individual files
testing<-read.table("UCI HAR Dataset/test/X_test.txt")
testing[,562] = read.table("UCI HAR Dataset/test/Y_test.txt")
testing[,563] = read.table("UCI HAR Dataset/test/subject_test.txt")

##Merges the TRAINING and TESTING datasets
dataSet<-rbind(training,testing)

##reads the labels
activityLabels<-read.table("UCI HAR Dataset/activity_labels.txt")

##Relabels the features so that they are easier to understand
features<-read.table("UCI HAR Dataset/features.txt")
features[,2] = gsub('-mean', '_Mean', features[,2])
features[,2] = gsub('-std', '_StdDev', features[,2])
features[,2] = gsub('[-()]', '', features[,2])

##Seggregates the Mean and StdDev from the data set
segCols<-grep(".*_Mean*|.*_StdDev.*", features[,2])
features <- features[segCols,]
segCols <- c(segCols, 562, 563)
dataSet<-dataSet[,segCols]

# Add the column names in "features" to the data set
colnames(dataSet) <- c(features$V2, "Activity", "Subject")

##From the data set, creates an independent tidy data set with the average of each variable for each activity and each subject.

currentActivity = 1
for (currentActivityLabel in activityLabels$V2) {
  dataSet$Activity <- gsub(currentActivity, currentActivityLabel, dataSet$Activity)
  currentActivity <- currentActivity + 1
}
dataSet$Activity <- as.factor(dataSet$Activity)
dataSet$Subject <- as.factor(dataSet$Subject)
dataSetMean <- aggregate(dataSet, by=list(Activity = dataSet$Activity, Subject=dataSet$Subject), mean)

# Remove the subject and activity mean since they don't have significant informatio
dataSetMean[,83] = NULL
dataSetMean[,82] = NULL
write.table(dataSetMean, "Clean Dataset.txt", row.names=FALSE, sep="\t")