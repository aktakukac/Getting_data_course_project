#### Coursera - Getting and Cleaning Data - Project Assignment
#### Created by: Mihaly Garamvolgyi on 2015.07.21

### setwd("WD directory comes here")

library(dplyr)
library(data.table)
library(stringr)
library(reshape2)

######## sourcing files for analysis  ###############################

## reads TEST data
Test_data <- read.table("./UCI/test/X_test.txt")

Test_data_labels <- read.table("./UCI/test/y_test.txt")

Test_subject <- read.table("./UCI/test/subject_test.txt")

## reads TRAIN data
Train_data <- read.table("./UCI/train/X_train.txt")

Train_data_labels <- read.table("./UCI/train/y_train.txt")

Train_subject <- read.table("./UCI/train/subject_train.txt")

## reads ACTIVITY LABELS
Activity_labels <- read.table("./UCI/activity_labels.txt")

## reads FEATURES
Features <- read.table("./UCI/features.txt")

######## dimension checking  ###############################

# print(dim(Test_data))
# print(dim(Test_data_labels))
# print(dim(Test_subject))
# print(dim(Train_data))
# print(dim(Train_data_labels))
# print(dim(Train_subject))

######## renaming variables  ###############################

options(warn=-1)

names(Test_data_labels)[names(Test_data_labels) == "V1"] = "Activity_label"
names(Test_subject)[names(Test_subject) == "V1"] = "Subject"

names(Train_data_labels)[names(Train_data_labels) == "V1"] = "Activity_label"
names(Train_subject)[names(Train_subject) == "V1"] = "Subject"

names(Activity_labels)[names(Activity_labels) == "V1"] = "Activity_label"
names(Activity_labels)[names(Activity_labels) == "V2"] = "Activity_description"

setnames(Test_data, 1:561, as.character(Features$V2))
setnames(Train_data, 1:561, as.character(Features$V2))

Test_data <- Test_data[ , !duplicated(colnames(Test_data))]
Train_data <- Train_data[ , !duplicated(colnames(Train_data))]

Test_data$Observation <- "Test"
Train_data$Observation <- "Train"

options(warn=0)

######## ASSIGNMENT TASK 1 - merge data sets ###############################

Test_data <- cbind(Test_data_labels, Test_data)
Test_data <- cbind(Test_subject, Test_data)
Train_data <- cbind(Train_data_labels, Train_data)
Train_data <- cbind(Train_subject, Train_data)

Full_data <- rbind(Test_data, Train_data)

# print(table(Full_data$Observation))

######## ASSIGNMENT TASK 2 - extract STD and MEAN columns ###################

Full_data <- cbind(select(Full_data, 1:2), 
                   select(Full_data, 480),
                   select(Full_data, contains("Mean")), 
                   select(Full_data, contains("std")) 
                   )

Full_data <- select(Full_data, -contains("angle"))

Full_data <- select(Full_data, -contains("meanFreq"))

######## ASSIGNMENT TASK 3 - add activity names ###############################

Full_data <- left_join(Full_data, Activity_labels, by="Activity_label")

Full_data <- cbind(select(Full_data, 1), 
                   select(Full_data, 3), 
                   select(Full_data, 70),
                   select(Full_data, 4:69 )
                   )

######## ASSIGNMENT TASK 4 - add variable names ###############################

Names_vector <- names(Full_data)

Names_vector <- gsub("BodyBody", "Body", Names_vector)

Names_vector <- as.data.frame(Names_vector)

Names_vector$'V1' <- NULL
Names_vector$'V1' <- ifelse(substr(Names_vector$Names_vector, 1, 4)=="Subj", "Subject", "")
Names_vector$'V1' <- ifelse(substr(Names_vector$Names_vector, 1, 4)=="Obse", "Observation", Names_vector$'V1')
Names_vector$'V1' <- ifelse(substr(Names_vector$Names_vector, 1, 4)=="Acti", "Activity_description", Names_vector$'V1')
Names_vector$'V1' <- ifelse(regexpr("std", Names_vector$Names_vector)>0, "Standard_Deviation", Names_vector$'V1')
Names_vector$'V1' <- ifelse(regexpr("mean", Names_vector$Names_vector)>0, "Mean", Names_vector$'V1')
Names_vector$'V2' <- NULL
Names_vector$'V2' <- ifelse(substr(Names_vector$Names_vector, 1, 1)=="t", "Time", "")
Names_vector$'V2' <- ifelse(substr(Names_vector$Names_vector, 1, 1)=="f", "Frequency", Names_vector$'V2')
Names_vector$'V3' <- NULL
Names_vector$'V3' <- ifelse(regexpr("Body", Names_vector$Names_vector)>0, "Body", "")
Names_vector$'V4' <- NULL
Names_vector$'V4' <- ifelse(regexpr("Acc", Names_vector$Names_vector)>0, "Acceleration", "")
Names_vector$'V5' <- NULL
Names_vector$'V5' <- ifelse(regexpr("Gravi", Names_vector$Names_vector)>0, "Gravity", "")
Names_vector$'V6' <- NULL
Names_vector$'V6' <- ifelse(regexpr("Jerk", Names_vector$Names_vector)>0, "Jerk", "")
Names_vector$'V7' <- NULL
Names_vector$'V7' <- ifelse(regexpr("Gyro", Names_vector$Names_vector)>0, "Gyroscope", "")
Names_vector$'V8' <- NULL
Names_vector$'V8' <- ifelse(regexpr("Mag", Names_vector$Names_vector)>0, "Magnitude", "")
Names_vector$'V9' <- NULL
Names_vector$'V9' <- ifelse(regexpr("-X", Names_vector$Names_vector)>0, "Axis_X", "")
Names_vector$'V9' <- ifelse(regexpr("-Y", Names_vector$Names_vector)>0, "Axis_Y", Names_vector$'V9')
Names_vector$'V9' <- ifelse(regexpr("-Z", Names_vector$Names_vector)>0, "Axis_Z", Names_vector$'V9')

Names_vector$Descriptive_name <- paste (
        Names_vector$'V1',
        Names_vector$'V2',
        Names_vector$'V3',
        Names_vector$'V4',
        Names_vector$'V5',
        Names_vector$'V6',
        Names_vector$'V7',
        Names_vector$'V8',
        Names_vector$'V9',
        sep = "_", 
        collapse = NULL)

Names_vector$Descriptive_name <- gsub("____", "_", Names_vector$Descriptive_name)
Names_vector$Descriptive_name <- gsub("___", "_", Names_vector$Descriptive_name)
Names_vector$Descriptive_name <- gsub("__", "_", Names_vector$Descriptive_name)
Names_vector$Descriptive_name <- gsub("_$", "", Names_vector$Descriptive_name)

Names_vector <- select(Names_vector, Descriptive_name)

Full_data <- setnames(Full_data, 1:69, as.character(Names_vector$Descriptive_name))


######## ASSIGNMENT TASK 5 - calculate averages ###############################

Full_data_averages <- select(Full_data, c(1, 3:69))

# dim(Full_data_averages)
# [1] 10299    68

Full_data_averages <- melt(Full_data_averages, id=c("Subject", "Activity_description"))

# dim(Full_data_averages)
# [1] 679734      4

Full_data_averages <- group_by(Full_data_averages, Subject, Activity_description, variable)

Full_data_averages <- summarize(Full_data_averages, Average_value=mean(value))

# dim(Full_data_averages)
# [1] 11880     4

Full_data_averages <- dcast(Full_data_averages, Subject + Activity_description ~ variable, value.var = "Average_value")

# dim(Full_data_averages)
# [1] 180  68

write.table(Full_data_averages, file = "./Course_project_output.txt", append = FALSE, quote = TRUE, sep = ";",
            eol = "\n", na = "NA", dec = ".", row.names = FALSE,
            col.names = TRUE, qmethod = c("escape", "double"),
            fileEncoding = "")

## Script for MD - read
## Data <- read.table("./Course_project_output.txt", header=TRUE, sep = ";", dec = ".")


