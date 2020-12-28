
  setwd("C:/Users/u57m27/Desktop/Coursera/Data Science/3.Getting and Cleaning Data")
  
  library(dplyr)
  
# download data if needed
  file_name < - 'UCI HAR Dataset'
  
  if(!file.exists(file_name)) { 
    url <-  "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(url, file_name, method = 'curl')
  }
  
# get data into R 
  activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
  features <- read.table("UCI HAR Dataset/features.txt", col.names = c("key","functions"))
  
  subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
  x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
  y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
  
  subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
  x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
  y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

# Merges the training and the test sets to create one data set 
  x_all <- rbind(x_train, x_test)
  y_all <- rbind(y_train, y_test)
  subject_all <- rbind(subject_train, subject_test)
  
  all <- cbind(x_all, y_all, subject_all)
  
# extracts only the measurements on the mean and standard deviation for each measurement 
  all <- all %>% select(subject, code, contains('mean'), contains("std"))

# use descriptive activity names to name activities in the data set 
  all$code <- activities[all$code, 2]

# appropriately labels the data set with descriptive variable names 
  colnames(all)
  names(all)[2] <- 'activity'
  
  names(all) <- gsub('^t', 'Time', names(all))
  names(all) <- gsub('^f', 'Frequency', names(all))
  names(all) <- gsub('^tBody', 'TimeBody', names(all))
  names(all) <- gsub('^angle', 'Angle', names(all))
  
  names(all) <- gsub('Acc', 'Accelerometer', names(all))
  names(all) <- gsub('Gyro', 'Gyroscope', names(all))
  names(all) <- gsub('tBody', 'TimeBody', names(all))
  
  names(all) <- gsub('gravity', 'Gravity', names(all))
  names(all) <- gsub('mean', 'Mean', names(all))
  names(all) <- gsub('std', 'STD', names(all))
  
# from the data set in step 4, create a 2nd, independent tidy data set with the average of 
  # each variable for each activity and each subject 
  
  final_data <- all %>% 
    group_by(subject, activity) %>% 
    summarize_all(funs(mean))
  
# save table 
  write.table(final_data, 'FinalData.txt', row.name=FALSE)
  
  
  
  