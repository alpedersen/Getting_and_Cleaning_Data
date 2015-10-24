#The first step is to merge the two datasets into one.
trainData <- read.table("./RunData/train/X_train.txt")
dim(trainData)
head(trainData)

trainLabel <- read.table("./RunData/train/y_train.txt")
table(trainLabel)

trainSubject <- read.table("./RunData/train/subject_train.txt")

testData <- read.table("./RunData/test/X_test.txt")
dim(testData)

testLabel <- read.table("./RunData/test/y_test.txt")
table(testLabel)

testSubject <- read.table("./RunData/test/subject_test.txt")

joinData <- rbind(trainData, testData)
dim(joinData)

joinLabel <- rbind(trainLabel,testLabel)
dim(joinLabel)

joinSubject <- rbind(trainSubject, testSubject)
dim(joinSubject)

#Since the question asks for the mean and standard deviations only,
#they must be extracted.

features <- read.table("./RunData/features.txt")
dim(features)

meanStdIndices <- grep("mean\\(\\)|std\\(\\)", features[, 2])
length(meanStdIndices)
joinData <- joinData[, meanStdIndices]
dim(joinData)

#In order to make everything consistent, some changes and substitutions
#need to be made. For example, mean needs to become Mean.

names(joinData) <- gsub("\\(\\)", "", features[meanStdIndices, 2])
names(joinData) <- gsub("mean", "Mean", names(joinData))
names(joinData) <- gsub("std", "Std", names(joinData))
names(joinData) <- gsub("-", "", names(joinData))

#To further assist in the merge and analysis, we need to label the data
#set with descriptive activity names.
activity <- read.table("./RunData/activity_labels.txt")
activity[, 2] <- tolower(gsub("_","",activity[, 2]))
substr(activity[2, 2], 8, 8) <- toupper(substr(activity[2, 2],8,8))
substr(activity[3, 2], 8, 8) <- toupper(substr(activity[3, 2], 8, 8))
activityLabel <- activity[joinLabel[, 1], 2]
joinLabel[, 1] <- activityLabel
names(joinLabel) <- "activity"
names(joinSubject) <- "subject"
cleanedData <- cbind(joinSubject, joinLabel, joinData)
dim(cleanedData)
write.table(cleanedData, "merged_data.txt")

#Now we need to create a second data set that contains the averages of each
#variable, each subject, and each activity.
subjectLen <- length(table(joinSubject))
activityLen <- dim(activity)[1]
columnLen <- dim(cleanedData)[2]
result <- matrix(NA, nrow=subjectLen*activityLen, ncol=columnLen)
result <- as.data.frame(result)
colnames(result) <- colnames(cleanedData)
row <- 1
for(i in 1:subjectLen)
{
        for(j in 1:activityLen)
        {
                result[row, 1] <- sort(unique(joinSubject)[, 1])[i]
                result[row, 2] <- activity[j, 2]
                bool1 <- i == cleanedData$subject
                bool2 <- activity[j, 2] == cleanedData$activity
                result[row, 3:columnLen] <- colMeans(cleanedData[bool1&bool2, 3:columnLen])
                row <- row + 1
        }
}
head(result)
write.table(result, "data_with_means.txt")