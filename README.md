# Getting and Cleaning Data Week-4 Course Project

The code file meets the objectives of the project by following steps mentioned below:

1. Download data from mentioned [URL](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
2. Unzip data into working directory
3. Read training and test data, features and activity labels
4. Assign column names to train & test data and activity label data 
5. Merge all the training data into one dataset
6. Merge all the test data into one dataset
7. Merge the merged train and test datasets into one big dataset.
8. Extract activityId, subjectId and all the features/columns containing 'mean' or 'std' from the merged dataset into a new dataset
9. Group the data with respect to subjectId and activityId by calculating mean for the respective groups.
10. Order the data w.r.t SubjectId and ActivityID
11. Assign a new feature containing Activity labels by merging the new data set with activityLabels by 'activityId'
12. Write the latest data set into a txt file.
