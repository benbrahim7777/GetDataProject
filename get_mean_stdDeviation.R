# get mean and deviation of a test


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