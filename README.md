---
title: "Readme"
author: "exbracer"
date: "Septempber 27, 2015"
ouput: html_document
---

# Getting-Cleaning_Data

This repository is for the project of the course Getting and Cleaning Data on Coursera Platform
This file describe the information about the project and how to run the script.



### 1. Information about the Project 
#### 1.1. Targets
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected. 

You should create one R script called run_analysis.R that does the following. 

1. Merge the training and the test sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for each measurement.
3. Use descriptive activity names to name the activities in the data set
4. Appropriately label the data set with descriptive variable names.
5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

#### 1.2. Data resourse
One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

### 2. Instruction about how to complish the Project
#### 2.1. Getting the raw data
Download the data through the link below

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Unzip the compressed file to a directory as you wish and a file holder called ***UCI HAR Dataset*** where the data is will be made by the computer system.
#### 2.2. Run the R script 
It's easy to run the script.  
The file of the script is ***run_analysis.R***, you just should do the command below:  
`source("run_analysis.R")`  
`run_analysis(file_path)`  
***file_path*** is the only argument that should be given to the function and it is the file directory of the fold ***UCI HAR Dataset***. ***file_path*** is a string.  
If your ***UCI HAR Dataset*** fold's directory is "~/Documents/course/getting-cleaning_data/projects/UCI HAR Dataset", just call:  
`source("run_analysis.R")`  
`run_analysis("~/Documents/course/getting-cleaning_data/projects/UCI HAR Dataset")`  

