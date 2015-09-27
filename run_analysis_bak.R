
get_mean_sd <- function(file_name1, file_name2) {
    file1 <- file(file_name1)
    file2 <- file(file_name2)
    content1 <- readLines(file1)
    content2 <- readLines(file2)
    test_size <- length(content1)
    train_size <- length(content2)
    data_size = test_size+train_size
    #print(class(data_size))
    data1_mean <- vector("numeric", length=data_size)
    data1_sd <- vector("numeric", length=data_size)
    print(length(data1_mean))
    
    for (i in 1:test_size) {
        #         print(content1[1])
        temp <- as.numeric(strsplit(content1[i], " ")[[1]])
        #         print(temp)
        good = !is.na(temp)
        temp1 <- temp[good]
        if (length(temp1) != 128) {
            print("wrong number")
            print(i)
            print(temp1)
            print(length(temp1))
            break
        }
        data1_mean[i] = mean(temp1)
        data1_sd[i] = sd(temp1)
    }
    print("hello")
    for (i in 1:train_size) {
        temp <- as.numeric(strsplit(content2[i], " ")[[1]])
        good <- !is.na(temp)
        temp1 <- temp[good]
        if (length(temp1) != 128) {
            print("wrong number")
            print(temp1)
            break
        }
        data1_mean[i+test_size] = mean(temp1)
        data1_sd[i+test_size] = sd(temp1)
    }
    
    close(file1)
    close(file2)
    
    df <- data.frame(data1_mean, data1_sd)
    df
}

get_activity_label <- function(file_name1, file_name2, activity_labels) {
    file1 <- file(file_name1)
    file2 <- file(file_name2)
    content1 <- readLines(file1)
    content2 <- readLines(file2)
    
    test_size <- length(content1)
    train_size <- length(content2)
    
    data_size = test_size + train_size
    data_label <- vector("character", length=data_size)
    
    for (i in 1:test_size) {
        activity_id <- as.integer(content1[i])
        data_label[i] <- activity_labels[activity_id]
        
    }
    
    for (i in 1:train_size) {
        activity_id <- as.integer(content2[i])
        data_label[i+test_size] <- activity_labels[activity_id]
    }
    
    close(file1)
    close(file2)
    
    data_label
}

get_subject <- function(file_name1, file_name2) {
    file1 <- file(file_name1)
    file2 <- file(file_name2)
    content1 <- readLines(file1)
    content2 <- readLines(file2)
    
    test_size <- length(content1)
    train_size <- length(content2)
    
    data_size = test_size + train_size
    data_subject <- vector("integer", length=data_size)
    
    for (i in 1:test_size) {
        data_subject[i] <- as.integer(content1[i])
        
    }
    
    for (i in 1:train_size) {
        data_subject[i+test_size] <- as.integer(content2[i])
    }
    
    close(file1)
    close(file2)
    
    data_subject
}

run_analysis <- function(file_path) {
    
    file_name1 <- paste(file_path, "activity_labels.txt", sep="")
    file1 <- file(file_name1)
    content <- readLines(file1)
    #print(content)
    for (i in 1:length(content)) {
        #print(content[i])
        content[i] <- substr(content[i], start=3, stop=nchar(content[i]))
    }
    activity_labels <- content
    close(file1)
    
    file_name1 <- paste(file_path, "features.txt", sep="")
    file1 <- file(file_name1)
    content <- readLines(file1)
    for (i in 1:length(content)) {
        temp <- strsplit(content[i], ' ')
        content[i] <- temp[[1]][2]
    }
    feature_list <- content
    close(file1)
    
    
    file_name1 <- paste(file_path, "test/Inertial Signals/body_acc_x_test.txt", sep="")
    file_name2 <- paste(file_path, "train/Inertial Signals/body_acc_x_train.txt", sep="")
    df_body_acc_x <- get_mean_sd(file_name1, file_name2)
    file_name1 <- paste(file_path, "test/Inertial Signals/body_acc_y_test.txt", sep="")
    file_name2 <- paste(file_path, "train/Inertial Signals/body_acc_y_train.txt", sep="")
    df_body_acc_y <- get_mean_sd(file_name1, file_name2)
    file_name1 <- paste(file_path, "test/Inertial Signals/body_acc_z_test.txt", sep="")
    file_name2 <- paste(file_path, "train/Inertial Signals/body_acc_z_train.txt", sep="")
    df_body_acc_z <- get_mean_sd(file_name1, file_name2)
    file_name1 <- paste(file_path, "test/Inertial Signals/body_gyro_x_test.txt", sep="")
    file_name2 <- paste(file_path, "train/Inertial Signals/body_gyro_x_train.txt", sep="")
    df_body_gyro_x <- get_mean_sd(file_name1, file_name2)
    file_name1 <- paste(file_path, "test/Inertial Signals/body_gyro_y_test.txt", sep="")
    file_name2 <- paste(file_path, "train/Inertial Signals/body_gyro_y_train.txt", sep="")
    df_body_gyro_y <- get_mean_sd(file_name1, file_name2)
    file_name1 <- paste(file_path, "test/Inertial Signals/body_gyro_z_test.txt", sep="")
    file_name2 <- paste(file_path, "train/Inertial Signals/body_gyro_z_train.txt", sep="")
    df_body_gyro_z <- get_mean_sd(file_name1, file_name2)
    file_name1 <- paste(file_path, "test/Inertial Signals/total_acc_x_test.txt", sep="")
    file_name2 <- paste(file_path, "train/Inertial Signals/total_acc_x_train.txt", sep="")
    df_total_acc_x <- get_mean_sd(file_name1, file_name2)
    file_name1 <- paste(file_path, "test/Inertial Signals/total_acc_y_test.txt", sep="")
    file_name2 <- paste(file_path, "train/Inertial Signals/total_acc_y_train.txt", sep="")
    df_total_acc_y <- get_mean_sd(file_name1, file_name2)
    file_name1 <- paste(file_path, "test/Inertial Signals/total_acc_z_test.txt", sep="")
    file_name2 <- paste(file_path, "train/Inertial Signals/total_acc_z_train.txt", sep="")
    df_total_acc_z <- get_mean_sd(file_name1, file_name2)
    
    print("vec_activity_label")
    file_name1 <- paste(file_path, "test/y_test.txt", sep="")
    file_name2 <- paste(file_path, "train/y_train.txt", sep="")
    vec_activity_label <- get_activity_label(file_name1, file_name2, activity_labels)
    
    print("vec_subject")
    file_name1 <- paste(file_path, "test/subject_test.txt", sep="")
    file_name2 <- paste(file_path, "train/subject_train.txt", sep="")
    vec_subject <- get_subject(file_name1, file_name2)
    
    col_names <- c("body_acc_x_mean", "body_acc_x_sd",
                   "body_acc_y_mean", "body_acc_y_sd", 
                   "body_acc_z_mean", "body_acc_z_sd",
                   "body_gyro_x_mean", "body_gyro_x_sd", 
                   "body_gyro_y_mean", "body_gyro_y_sd",
                   "body_gyro_z_mean", "body_gyro_z_sd",
                   "total_acc_x_mean", "total_acc_x_sd", 
                   "total_acc_y_mean", "total_acc_y_sd", 
                   "total_acc_z_mean", "tatal_acc_z_sd",
                   "activity_label", "subject_id")
    data_set <- data.frame(df_body_acc_x[[1]], df_body_acc_x[[2]],
                           df_body_acc_y[[1]], df_body_acc_y[[2]],
                           df_body_acc_z[[1]], df_body_acc_z[[2]],
                           df_body_gyro_x[[1]], df_body_gyro_x[[2]],
                           df_body_gyro_y[[1]], df_body_gyro_y[[2]], 
                           df_body_gyro_z[[1]], df_body_gyro_z[[2]],
                           df_total_acc_x[[1]], df_total_acc_x[[2]],
                           df_total_acc_y[[1]], df_total_acc_y[[2]],
                           df_total_acc_z[[1]], df_total_acc_z[[2]],
                           vec_activity_label, vec_subject)
    colnames(data_set) <- col_names
    
    write.table(data_set, "data_set.txt", row.names = FALSE, col.names = TRUE, quote = FALSE)
    
    
    
    data_size = 30*6
    vec_body_acc_x_mean <- vector("numeric", length=data_size)
    vec_body_acc_x_sd <- vector("numeric", length=data_size)
    vec_body_acc_y_mean <- vector("numeric", length=data_size)
    vec_body_acc_y_sd <- vector("numeric", length=data_size)
    vec_body_acc_z_mean <- vector("numeric", length=data_size)
    vec_body_acc_z_sd <- vector("numeric", length=data_size)
    vec_body_gyro_x_mean <- vector("numeric", length=data_size)
    vec_body_gyro_x_sd <- vector("numeric", length=data_size)
    vec_body_gyro_y_mean <- vector("numeric", length=data_size)
    vec_body_gyro_y_sd <- vector("numeric", length=data_size)
    vec_body_gyro_z_mean <- vector("numeric", length=data_size)
    vec_body_gyro_z_sd <- vector("numeric", length=data_size)
    vec_total_acc_x_mean <- vector("numeric", length=data_size)
    vec_total_acc_x_sd <- vector("numeric", length=data_size)
    vec_total_acc_y_mean <- vector("numeric", length=data_size)
    vec_total_acc_y_sd <- vector("numeric", length=data_size)
    vec_total_acc_z_mean <- vector("numeric", length=data_size)
    vec_total_acc_z_sd <- vector("numeric", length=data_size)
    vec_act_label <- vector("character", length=data_size)
    vec_subject <- vector("integer", length=data_size)
    row_num <- 0
    # for each activity
    for (i in 1:30) {
        for (j in 1:6) {
            row_num <- row_num + 1
            label <- activity_labels[j]
            id <- i
            #print(label)
            #print(id)
            sub_df <- subset(data_set, data_set$activity_label==label)
            sub_df <- subset(sub_df, sub_df$subject_id == id)
            #print(nrow(sub_df))
            
            vec_body_acc_x_mean[row_num] <- mean(sub_df[[1]])
            vec_body_acc_y_mean[row_num] <- mean(sub_df[[3]])
            vec_body_acc_z_mean[row_num] <- mean(sub_df[[5]])
            vec_body_gyro_x_mean[row_num] <- mean(sub_df[[7]])
            vec_body_gyro_y_mean[row_num] <- mean(sub_df[[9]])
            vec_body_gyro_z_mean[row_num] <- mean(sub_df[[11]])
            vec_total_acc_x_mean[row_num] <- mean(sub_df[[13]])
            vec_total_acc_y_mean[row_num] <- mean(sub_df[[15]])
            vec_total_acc_z_mean[row_num] <- mean(sub_df[[17]])
            
            vec_body_acc_x_sd[row_num] <- mean(sub_df[[2]])
            vec_body_acc_y_sd[row_num] <- mean(sub_df[[4]])
            vec_body_acc_z_sd[row_num] <- mean(sub_df[[6]])
            vec_body_gyro_x_sd[row_num] <- mean(sub_df[[8]])
            vec_body_gyro_y_sd[row_num] <- mean(sub_df[[10]])
            vec_body_gyro_z_sd[row_num] <- mean(sub_df[[12]])
            vec_total_acc_x_sd[row_num] <- mean(sub_df[[14]])
            vec_total_acc_y_sd[row_num] <- mean(sub_df[[16]])
            vec_total_acc_z_sd[row_num] <- mean(sub_df[[18]])
            vec_act_label[row_num] <- activity_labels[j]
            vec_subject[row_num] <- id
        }
    }
    
    sec_data_set <- data.frame(vec_body_acc_x_mean, vec_body_acc_x_sd,
                               vec_body_acc_y_mean, vec_body_acc_y_sd,
                               vec_body_acc_z_mean, vec_body_acc_z_sd,
                               vec_body_gyro_x_mean, vec_body_gyro_x_sd,
                               vec_body_gyro_y_mean, vec_body_gyro_y_sd,
                               vec_body_gyro_z_mean, vec_body_gyro_z_sd,
                               vec_total_acc_x_mean, vec_total_acc_x_mean,
                               vec_total_acc_y_mean, vec_total_acc_y_mean,
                               vec_total_acc_z_mean, vec_total_acc_z_mean,
                               vec_act_label,
                               vec_subject)
    new_col_names <- c("mean_of_body_acc_x_mean", "mean_of_body_acc_x_sd",
                       "mean_of_body_acc_y_mean", "mean_of_body_acc_y_sd",
                       "mean_of_body_acc_z_mean", "mean_of_body_acc_z_sd",
                       "mean_of_body_gyro_x_mean", "mean_of_body_gyro_x_sd",
                       "mean_of_body_gyro_y_mean", "mean_of_body_gyro_y_sd", 
                       "mean_of_body_gyro_z_mean", "mean_of_body_gyro_z_sd", 
                       "mean_of_total_acc_x_mean", "mean_of_total_acc_x_sd", 
                       "mean_of_total_acc_y_mean", "mean_of_total_acc_y_sd",
                       "mean_of_total_acc_z_mean", "mean_of_total_acc_z_sd",
                       "activity_lable", "subject_id")
    colnames(sec_data_set) <- new_col_names
    
    write.table(sec_data_set, "sec_data_set.txt", row.names = FALSE, col.names = TRUE, quote = FALSE)
    # for each subject
    
    
    
}