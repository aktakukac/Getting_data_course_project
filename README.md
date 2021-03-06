---
title: "Human Activity Recognition Using Smartphone Dataset <br/> 
        Data preparation for modeling purposes"
author: "Mihaly Garamvolgyi"
date: "2015-07-24"

---

## Human Activity Recognition Using Smartphone Dataset <br/> Data preparation for modeling purposes <br/> Coursera Project Submission


## contents of the repository: 
1. README.md
2. run_analysis.R
3. Codebook.md
4. Course_project_output.txt

## Project Description
The purpose of the project was to create a tidy dataset from the original raw data using R. This repository contains the tools used to create this tidy dataset and the description of the methods used together with the variables of choice.
This document describes how to use the R script and what it does, and why I consider the dataset tidy after running the script. 

## Original data
The dataset is based on the following original data:
---
Human Activity Recognition Using Smartphones Dataset Version 1.0
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto
www.smartlab.ws
---

## Requiements to use the script
Save and unzip the following original data to your working directory:
[Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) <br/>
the folder structure should look like the following:<br/>
<br/>
./UCI contains<br/> 
  activity_labels<br/>
  features<br/>
  features_info<br/>
./UCI/test contains <br/>
  subject_test<br/>
  X_test<br/>
  Y_test<br/>
./UCI/train contains<br/> 
  subject_train<br/>
  X_train<br/>
  Y_train<br/>
The description of the files are in the Codebook.md supplied in the repository<br/>
<br/>
The R script is written in R version 3.2.1 (2015-06-18)<br/>   
Uses the following libraries: dplyr, data.table stringr reshape2<br/>
<br/>
## Running the run_analysis.R script
for running the script after downloading the source data:
1. place the script in your working directory
2. open RConsole/RStudio
3. set your working directory using setwd() 
4. open the script and source it or type source('run_analysis-1.R')
5. the output file will be exported to your working directory

## Opening the Course_project_output.txt 
To open the sample output use the following R command:

```{r}
Data <- read.table("./Course_project_output.txt", header=TRUE, sep = ";", dec = ".")
```

## Tidy data desciption
The layout of the data is in [wide format](https://en.wikipedia.org/wiki/Wide_and_narrow_data)
In the wide format the rows of the table is the observations with all variables for each person/activity combination.
The data contains a header with descriptive variable names (see Codebook.MD), uses semicolon as separator and decimal point for numbers. 

## What the R code does

#### 1 reads data
* Test_data
* Test_data_labels
* Test_subject
* Train_data
* Train_data_labels
* Train_subject
* Activity_labels
* Features

#### 2 renames variables

#### 3 removes duplicate columns

#### 4 flags and merges Test and Train data 

  See: Assignment task 1


#### 5 gathers required variables containing standard deviation and means 

   See: Assignment task 2


#### 6 adds activity names from activity labels 

   See: Assignment task 3


#### 7 adds descriptive variable names  
   
   See: Assignment task 4<br/>
   See: Codebook.md<br/>


#### 8 summarizes data per subject/activity and variable means 
   
   See: Assignment task 5


#### 9 exports data to output.txt in working directory 



