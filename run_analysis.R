# This code is the R script for the project of the course Getting and Cleaning Data.
# Copy right by exbracer 

# The instruction of the course project is as below:
# You should create one R script called run_analysis.R that does the following. 
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the average 
# of each variable for each activity and each subject.

run_analysis <- function() {
    
    file_holder_path = "./UCI HAR Dataset"
    # Step 0
    # Initialized work. Just get the directory of each file needed ready and read the 
    # data of the activity_labels.txt and features.txt
    
    # get the path of the data of measurements, the activity and the subject
    train_file_path <- paste(file_holder_path, "/train/X_train.txt", sep="")
    train_label_file_path <- paste(file_holder_path, "/train/y_train.txt", sep="")
    train_subject_file_path <- paste(file_holder_path, "/train/subject_train.txt", sep="")
    
    test_file_path <- paste(file_holder_path, "/test/X_test.txt", sep="")
    test_label_file_path <- paste(file_holder_path, "/test/y_test.txt", sep="")
    test_subject_file_path <- paste(file_holder_path, "/test/subject_test.txt", sep="")
    
    # read activity_labels.txt and get activity labels into a vector called activity_labels
    file1_path <- paste(file_holder_path, "/activity_labels.txt", sep = "")
    file1 <- file(file1_path)
    content <- readLines(file1)
    
    for (i in 1:length(content)) {
        content[i] <- substr(content[i], start=3, stop=nchar(content[i]))
        
    }
    activity_labels <- content
    close(file1)
    
    # read features.txt and get list of all kinds of features into a vector called features_list
    file2_path <- paste(file_holder_path, "/features.txt", sep="")
    file2 <- file(file2_path)
    content <- readLines(file2)
    for (i in 1:length(content)) {
        temp <- strsplit(content[i], ' ')
        content[i] <- temp[[1]][2]
    }
    features_list <- content
    close(file2)
    

    # Step 1
    # Merges the training and the test sets to create one data set.
    
    # read the data from the train and test file
    train_measurement <- read.table(train_file_path)
    train_label <- read.table(train_label_file_path)
    train_subject <- read.table(train_subject_file_path)
    
    test_measurement <- read.table(test_file_path)
    test_label <- read.table(test_label_file_path)
    test_subject <- read.table(test_subject_file_path)
    
    full_measurement <- rbind(train_measurement, test_measurement)
    full_label <- rbind(train_label, test_label)
    full_subject <- rbind(train_subject, test_subject)
    
    # give each column a name
    names(full_label) <- "activity_label"
    names(full_subject) <- "subject_id"
    #names(full_measurement) <- tolower(features_list)
    names(full_measurement) <- features_list
    
    full_data <- cbind(full_measurement, full_label, full_subject)
    
    # Step 2
    # Extracts only the measurements on the mean and standard deviation for each measurement.
    fliter <- grep("mean\\(\\)|std\\(\\)", tolower(features_list))
    fliter <- c(fliter, 562, 563)

    extract_data <- full_data[, fliter]
    
    # Step 3
    # Uses descriptive activity names to name the activities in the data set
    activities <- activity_labels[full_label[, 1]]
    extract_data$activity_label <- activities
    
    # Step 4
    # Appropriately labels the data set with descriptive variable names. 
    column_names <- names(extract_data)
    column_names <- gsub("Acc", "_accelerometer", column_names)
    column_names <- gsub("Gyro", "_gyroscope", column_names)
    column_names <- gsub("Mag", "_magnitude", column_names)
    column_names <- gsub("^t", "time", column_names)
    column_names <- gsub("^f", "frequency", column_names)
    column_names <- gsub("-mean\\(\\)", "_mean", column_names)
    column_names <- gsub("-std\\(\\)", "_std", column_names)
    column_names <- gsub("Jerk", "_jerk_signals", column_names)
    column_names <- gsub("BodyBody", "Body", column_names)
    column_names <- gsub("Body", "_body", column_names)
    column_names <- gsub("Gravity", "_gravity", column_names)
    names(extract_data) <- column_names
    # extract_data
    
    # Step 5
    # From the data set in step 4, creates a second, independent tidy data set with the average 
    # of each variable for each activity and each subject.
    
    #extract_data$subject_id <- as.factor(extract_data$subject_id)
    
    #tidy_data <- aggregate(.~subject_id+activity_label, extract_data, FUN=mean)
    tidy_data <- aggregate(.~activity_label+subject_id, extract_data, FUN=mean)
    tidy_data_file_path <- paste(file_holder_path, "/tidy_data.txt", sep="")
    write.table(tidy_data, tidy_data_file_path, row.name=FALSE)
    tidy_data
    
    
    
    
    
}