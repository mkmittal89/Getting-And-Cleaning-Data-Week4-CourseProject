# set working directory
NewDi<-"C:\\Users\\Manish\\Google Drive\\Coursera-DataScience\\Getting and Cleaning Data\\Week4"
setwd(NewDi)

# download and unzip
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipname<-"Samsung.zip"
download.file(url,zipname)
unzip(zipname)

#Read training data and test data
pathdata<-file.path("UCI HAR Dataset")
xtrain = read.table(file.path(pathdata, "train", "X_train.txt"),header = FALSE)
ytrain = read.table(file.path(pathdata, "train", "y_train.txt"),header = FALSE)
subject_train = read.table(file.path(pathdata, "train", "subject_train.txt"),header = FALSE)

#Read the test data
xtest<-read.table(file.path(pathdata, "test", "X_test.txt"),header = FALSE)
ytest<-read.table(file.path(pathdata, "test", "y_test.txt"),header = FALSE)
subject_test = read.table(file.path(pathdata, "test", "subject_test.txt"),header = FALSE)

#Read the features data
features = read.table(file.path(pathdata, "features.txt"),header = FALSE)

#Read activity labels data
activityLabels = read.table(file.path(pathdata, "activity_labels.txt"),header = FALSE)

#assigning column names to the train tables
colnames(xtrain)=features[,2]
colnames(ytrain)="activityId"
colnames(subject_train)="subjectId"

#assigning column names to the test tables
colnames(xtest)=features[,2]
colnames(ytest)="activityId"
colnames(subject_test)="subjectId"

colnames(activityLabels)<-c("activityId","activityType")

#merging the train and test datasets to form one big dataset
mrg_train<-cbind(ytrain,subject_train,xtrain)
mrg_test<-cbind(ytest,subject_test,xtest)
AllInOne<-rbind(mrg_train,mrg_test)

#getting all the mean std columns
colNames<-colnames(AllInOne)
mean_and_std<-(grepl("activityId" , colNames) | grepl("subjectId" , colNames) | grepl("mean.." , colNames) | grepl("std.." , colNames))
MeanAndStd <- AllInOne[ , mean_and_std == TRUE]

#Attach the activity names to the data
#WithActivityNames<-merge(MeanAndStd, activityLabels, by='activityId', all.x=TRUE)

#get the mean w.r.t subjectId and activityId of each feature
MyTidySet1 <- aggregate(. ~subjectId + activityId, MeanAndStd, mean)
MyTidySet2 <- MyTidySet[order(MyTidySet1$subjectId, MyTidySet1$activityId),]
MyTidySet3<-merge(activityLabels,MyTidySet1,by='activityId', all.x=TRUE)

#Save the new dataset in a file

write.table(MyTidySet3, "MyTidySet.txt", row.name=FALSE)