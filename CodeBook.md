---
title: "CodeBook"
author: "exbracer"
date: "Septempber 27, 2015"
ouput: html_document
---

# Codebook for the project of Getting and Cleaning Data
This repository is for the project of the course Getting and Cleaning Data on Coursera Platform.
This file describe the information of variables in the data set, the summary choices made and experimental study design used.

### Study Design
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The detailed information can be found in the ***README.txt*** file and ***feature_info.txt*** in the ***UCI HAR Dataset*** file holder.
### Collection of the raw data
The raw data for this project can be obtained througth the following link:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### Variables in the generated tidy data set
There are 68 kinds of variables in the new generated tidy data set, which contains 66 kinds of featrure.  

The final tidy data set is generated according to the following steps:

1. Merge the training and the test sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for each measurement.
3. Use descriptive activity names to name the activities in the data set
4. Appropriately label the data set with descriptive variable names.
5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

The information about the variables in the generated tidy data set is as below:

**"activity_label"**    
This variable is string.  
This variable represent the activity type, which may be *"Walking"* *"Walking Upstairs"* *"Walking Downstairs"* *"Sitting"* *"Standing"* *"Laying"* 

**"subject_id"**        
This variable is a integer, which is the id of subject

All the other 66 variables are the ones extracted for the tidy data set according to the instruction of the project.
The following 66 variables are float numbers and they each represent the measurement as their names described. The *time* prefix means this measurement is measure at **Time Domain**, while the *frequency* prefix means **Frequency Domain**.



**"time_body_accelerometer_mean-X"**                           
**"time_body_accelerometer_mean-Y"**                          
**"time_body_accelerometer_mean-Z"**                       
**"time_body_accelerometer_std-X" **                          
**"time_body_accelerometer_std-Y"**                            
**"time_body_accelerometer_std-Z"**                           
**"time_gravity_accelerometer_mean-X" **                       
**"time_gravity_accelerometer_mean-Y"**                       
**"time_gravity_accelerometer_mean-Z"**                        
**"time_gravity_accelerometer_std-X" **                       
**"time_gravity_accelerometer_std-Y"**                         
**"time_gravity_accelerometer_std-Z"**                        
**"time_body_accelerometer_jerk_signals_mean-X"**              
**"time_body_accelerometer_jerk_signals_mean-Y"**           
**"time_body_accelerometer_jerk_signals_mean-Z"**              
**"time_body_accelerometer_jerk_signals_std-X"**              
**"time_body_accelerometer_jerk_signals_std-Y"**               
**"time_body_accelerometer_jerk_signals_std-Z"**              
**"time_body_gyroscope_mean-X"**                               
**"time_body_gyroscope_mean-Y"**                              
**"time_body_gyroscope_mean-Z"**                               
**"time_body_gyroscope_std-X"**                               
**"time_body_gyroscope_std-Y"**                                
**"time_body_gyroscope_std-Z"**                               
**"time_body_gyroscope_jerk_signals_mean-X"**                  
**"time_body_gyroscope_jerk_signals_mean-Y"**                 
**"time_body_gyroscope_jerk_signals_mean-Z"**                  
**"time_body_gyroscope_jerk_signals_std-X"**                  
**"time_body_gyroscope_jerk_signals_std-Y"**                   
**"time_body_gyroscope_jerk_signals_std-Z"**                  
**"time_body_accelerometer_magnitude_mean"**                   
**"time_body_accelerometer_magnitude_std"**                   
**"time_gravity_accelerometer_magnitude_mean"**                
**"time_gravity_accelerometer_magnitude_std"**                
**"time_body_accelerometer_jerk_signals_magnitude_mean"**      
**"time_body_accelerometer_jerk_signals_magnitude_std"**      
**"time_body_gyroscope_magnitude_mean"**                       
**"time_body_gyroscope_magnitude_std"**                       
**"time_body_gyroscope_jerk_signals_magnitude_mean"**          
**"time_body_gyroscope_jerk_signals_magnitude_std"**          
**"frequency_body_accelerometer_mean-X"**                      
**"frequency_body_accelerometer_mean-Y"**                     
**"frequency_body_accelerometer_mean-Z"**                      
**"frequency_body_accelerometer_std-X"**                      
**"frequency_body_accelerometer_std-Y"**                       
**"frequency_body_accelerometer_std-Z"**                      
**"frequency_body_accelerometer_jerk_signals_mean-X"**         
**"frequency_body_accelerometer_jerk_signals_mean-Y"**        
**"frequency_body_accelerometer_jerk_signals_mean-Z"**         
**"frequency_body_accelerometer_jerk_signals_std-X"**         
**"frequency_body_accelerometer_jerk_signals_std-Y"**          
**"frequency_body_accelerometer_jerk_signals_std-Z"**         
**"frequency_body_gyroscope_mean-X"**                          
**"frequency_body_gyroscope_mean-Y"**                         
**"frequency_body_gyroscope_mean-Z"**                          
**"frequency_body_gyroscope_std-X"**                          
**"frequency_body_gyroscope_std-Y"**                           
**"frequency_body_gyroscope_std-Z"**                         
**"frequency_body_accelerometer_magnitude_mean"**              
**"frequency_body_accelerometer_magnitude_std"**              
**"frequency_body_accelerometer_jerk_signals_magnitude_mean"** 
**"frequency_body_accelerometer_jerk_signals_magnitude_std"** 
**"frequency_body_gyroscope_magnitude_mean"**                  
**"frequency_body_gyroscope_magnitude_std"**                  
**"frequency_body_gyroscope_jerk_signals_magnitude_mean"**     
**"frequency_body_gyroscope_jerk_signals_magnitude_std"**

### Information about the summary choices
When extract only the measurements on the mean and standard deviation for each measurement, I just choose the variables whose name contain ***mean()*** or ***std()***. There are many explaination in different threads on the forum, I won't talk about why it make sense.






