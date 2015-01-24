# Getting and Cleaning Data

## Course Project

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

You should create one R script called run_analysis.R that does the following. 

1- Merges the training and the test sets to create one data set.

2- Extracts only the measurements on the mean and standard deviation for each measurement. 

3- Uses descriptive activity names to name the activities in the data set

4- Appropriately labels the data set with descriptive variable names. 

5- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.




## Course project Execution Methodology

1- Get the data for the project from : 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

2- Unzip the downloaded file in "./data/UCI HAR Dataset/" directory.

3- Put all R scripts in your current directory which should the parent directory of "./data/UCI HAR Dataset/".

4- Set the RStudio working directory to the directory containing R scripts.

5- Run "run_analysis.R" to save tidy merged data to "./my_tidy_average_merged_data.txt".



## Course project Libraries 

The "run_analysis.R" epends on two libraries: "reshape2" and "data.table". 