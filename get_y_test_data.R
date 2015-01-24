
get_y_data <- function(fileName)
{
    my_y_activity_labels  <- read.table("./data/UCI HAR Dataset/activity_labels.txt")[,2]
    my_y_data             <- read.table(fileName)
    
    my_y_data[,2]     = my_y_activity_labels[my_y_data[,1]]
    names(my_y_data)  = c("Activity_ID", "Activity_Label")
  
    return (my_y_data)
  
}


get_subject_data <- function(fileName)
{
    my_subject_test <- read.table(fileName)
    
    names(my_subject_test) = "subject"
    
    return (my_subject_test)
  
}

