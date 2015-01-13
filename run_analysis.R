library(dplyr)

#read in data
labels <- read.csv("features.txt", sep="", header=FALSE)
activities<- read.csv("activity_labels.txt", sep="", header=FALSE)

train <- read.csv("train/X_train.txt", sep="", header=FALSE)
#add the column labels
names(train) <- labels[,2]

trainY <- read.csv("train/y_train.txt", sep="", header=FALSE)
trainSubject <- read.csv("train/subject_train.txt", sep="", header=FALSE)

test <- read.csv("test/X_test.txt", sep="", header=FALSE)
#add the column labels
names(test) <- labels[,2]

testY <- read.csv("test/y_test.txt", sep="", header=FALSE)
testSubject <- read.csv("test/subject_test.txt", sep="", header=FALSE)

#merge
train[,"Activity"] <- trainY
train[,"Subject"] <- trainSubject

trainAndTest <- merge(train, test, all=TRUE)

#add the activity names
levels(trainAndTest$Activity) <- activities[,2]

#grab just the mean measurements
meanColumns <- grep("mean|std", colnames(trainAndTest))
justMeansAndSTD <- trainAndTest[,meanColumns]

#take mean against activity and subject
tidy = aggregate(trainAndTest, by=list(Activity = trainAndTest$Activity, Subject = trainAndTest$Subject), mean)
#and write it out
write.table(tidy, "tidy.txt", sep=",", row.name=FALSE)