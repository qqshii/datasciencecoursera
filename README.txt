 ==================================================================

 The dataset includes the following files:
 =========================================

 - 'README.txt'

 - 'codebook': describes the variables in the data set

 - 'run_analysis.r': R script that creates a tidy data set that contains mean and standard deviation of each variable for each activity and     each subject


 How the R script works: 
 =========================================
 - The Data for the project can be found here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
 - R script does the following
	- Merges the training and the test sets to create one data set 
	- Extracts only the measurements on the mean and standard deviation for each measurement 
	- Use descriptive activity names to name the activities in the data set 
	- Appropriately labels the data set with descriptive variable names 
	- from the data set in previous step, create a second, independent tidy data set with the average of each variable for each 	  	  activity and each subject. 