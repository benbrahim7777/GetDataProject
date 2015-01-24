##Here are the data for the project: 
  
#  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

# 1-create one R script called run_analysis.R that does the following. 
# 2- Merges the training and the test sets to create one data set.
# 3- Extracts only the measurements on the mean and standard deviation for each measurement. 
# 4- Uses descriptive activity names to name the activities in the data set
# 5- Appropriately labels the data set with descriptive variable names. 
# 6- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


#getLibraries function

getLibrairies <- function() {
  if (!require("data.table")) {
    install.packages("data.table")
  }
  
  if (!require("reshape2")) {
    install.packages("reshape2")
  }
  
  require("data.table")
  require("reshape2")
  
}


# function to get mean and deviation of test nd trin data


get_mean_stdDeviation <- function(fileName)
{
  
  my_features           <- read.table("./data/UCI HAR Dataset/features.txt")[,2]
  my_mean_std_features  <- grepl("mean|std", my_features)
  
  
  # get test data
  my_x_test <- read.table(fileName)
  
  # extract mean and std data
  names(my_x_test) = my_features      
  my_x_test_mean_stdDeviation = my_x_test[,my_mean_std_features]
  
  #return extract data
  return (my_x_test_mean_stdDeviation)
}

#function to get y_data

get_y_data <- function(fileName)
{
  my_y_activity_labels  <- read.table("./data/UCI HAR Dataset/activity_labels.txt")[,2]
  my_y_data             <- read.table(fileName)
  
  my_y_data[,2]     = my_y_activity_labels[my_y_data[,1]]
  names(my_y_data)  = c("Activity_ID", "Activity_Label")
  
  return (my_y_data)
  
}

#function to get subject data

get_subject_data <- function(fileName)
{
  my_subject_test <- read.table(fileName)
  
  names(my_subject_test) = "subject"
  
  return (my_subject_test)
  
}


# get column names for mean and std data of x test and x training
# Extracts only the measurements on the mean and standard deviation for each measurement. 
# Uses descriptive activity names to name the activities in the data set

my_x_test_fileName <- "./data/UCI HAR Dataset/test/X_test.txt"
my_x_test_mean_std <- get_mean_stdDeviation(my_x_test_fileName)

my_x_train_fileName <- "./data/UCI HAR Dataset/train/X_train.txt"
my_x_train_mean_std <- get_mean_stdDeviation(my_x_train_fileName)

# get y test and y training labels
# Uses descriptive activity names to name the activities in the data set

my_y_test_fileName <- "./data/UCI HAR Dataset/test/y_test.txt"
my_y_test_labels    <- get_y_data(my_y_test_fileName)

my_y_train_fileName <- "./data/UCI HAR Dataset/train/y_train.txt"
my_y_train_labels  <- get_y_data(my_y_train_fileName)

# get subject data
# Uses descriptive activity names to name the activities in the data set
my_subject_test_fileName  <- "./data/UCI HAR Dataset/test/subject_test.txt"
my_subject_test           <- get_subject_data(my_subject_test_fileName)

my_subject_train_fileName <-   "./data/UCI HAR Dataset/train/subject_train.txt"
my_subject_train          <- get_subject_data(my_subject_train_fileName)




# bind test data and trining data with descriptive activity names to name the activities in the data set
my_test_data <- cbind(as.data.table(my_subject_test), my_y_test_labels, my_x_test_mean_std)
my_train_data <- cbind(as.data.table(my_subject_train), my_y_train_labels, my_x_train_mean_std)


# Merges the training and the test sets to create one data set. 
my_meged_data = rbind(my_test_data, my_train_data)



# Creates a second, independent tidy data set with the average of each variable 
# for each activity and each subject.


# get tidy data from merged data
my_id_labels   = c("subject", "Activity_ID", "Activity_Label")
my_dataVariables_labels = setdiff(colnames(my_meged_data), my_id_labels)
my_melt_merged_data      = melt(my_meged_data, id = my_id_labels, measure.vars = my_dataVariables_labels)

# get tidy average data for each variable
my_tidy_average_merged_data   = dcast(my_melt_merged_data, subject + Activity_Label ~ variable, mean)

# save  tidy average data in a file
write.table(my_tidy_average_merged_data, file = "./my_tidy_average_merged_data.txt", row.name=FALSE)


