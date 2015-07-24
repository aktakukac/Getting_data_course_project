---
title: "Human Activity Recognition Using Smartphone Dataset <br/> 
        Data preparation for modeling purposes"
author: "Mihaly Garamvolgyi"
date: "2015-07-24"

---

## Human Activity Recognition Using Smartphone Dataset <br/> Codebook v1.0 <br/> Coursera Project Submission

### Original data
The original data of the project comes from [Smartlabs](www.smartlabs.com)
See [link]((https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) for original data and more on the contents
> "The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
The original data features come from the accelerometer and gyroscope 3-axial raw signals. These were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals. Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm. Finally a Fast Fourier Transform (FFT) was applied to some of these signals. "


### Data modifications carried out
The original data was merged to create a Test + Train = Full dataset with keys denoting the source of the observation
Feature names were imported from features.txt and used as original variable names.
Observations were linked to the subject. 
Activity labels were changed to descriptive activity names
Data selection and filtering were carried out See: Data Selection of this document
Descriptive variable names were created See: Variable Names section of this document
Data aggregation was carried out to get a summary of data See: Data Summarization section of this document
The complete list of variables in output is available at Output Variables & Measures section of this document

### Data Selection
Data referring to Averages and Standard deviation were included in the final dataset. Mean frequencies were not considered mean measures, hence they were filtered. This resulted in a dataset of 66 measured variables.

### Variable Names
Descriptive variable names refer to the content of the measured
#### Measures:
Mean - refers to mean of the measured variable
Standard_deviation refers to the standard deviation of the measure
#### Measurement reference:
Body - denotes the body motion component of the measure
Gravity - denotes the gravitational component of the measure
Acceleration - denotes the measure is for the acceleration component of the observation 
Gyroscope -  denotes the measure is for the measurement on the gyroscope of the smartphone
Jerk - derived jerk signal from body linear acceleration and angular velocity. 
Magnitude -  calculated magnitude of the three-dimensional signals. 
#### Domain:
Time - Time domain signals of the observation
Frequency - Frequency domain of the observation
#### Axes:
Axis_X - measurement along X axis
Axis_Y - measurement along Y axis
Axis_Z - measurement along Z axis

### Data Summarization
Data was then summarized - mean values were calculated for each subject/activity type for all measures to get a compact dataset of 30*6 observations and 66 measurement averages. 

### Output Variables & Measures

#### Identification variables: 
Subject  -  denotes the number of the individual that carried out the activity
Activity_description  - denotes the activity 
Possible values: LAYING, SITTING,STANDING,WALKING,WALKING_DOWNSTAIRS, WALKING_UPSTAIRS  

#### Measures:
All measures are scale irrelevant, as they are normalized and have a range of [-1, 1]

Mean_Time_Body_Acceleration_Axis_X
Mean_Time_Body_Acceleration_Axis_Y
Mean_Time_Body_Acceleration_Axis_Z
Mean_Time_Acceleration_Gravity_Axis_X
Mean_Time_Acceleration_Gravity_Axis_Y
Mean_Time_Acceleration_Gravity_Axis_Z
Mean_Time_Body_Acceleration_Jerk_Axis_X
Mean_Time_Body_Acceleration_Jerk_Axis_Y
Mean_Time_Body_Acceleration_Jerk_Axis_Z
Mean_Time_Body_Gyroscope_Axis_X
Mean_Time_Body_Gyroscope_Axis_Y
Mean_Time_Body_Gyroscope_Axis_Z
Mean_Time_Body_Jerk_Gyroscope_Axis_X
Mean_Time_Body_Jerk_Gyroscope_Axis_Y
Mean_Time_Body_Jerk_Gyroscope_Axis_Z
Mean_Time_Body_Acceleration_Magnitude
Mean_Time_Acceleration_Gravity_Magnitude
Mean_Time_Body_Acceleration_Jerk_Magnitude
Mean_Time_Body_Gyroscope_Magnitude
Mean_Time_Body_Jerk_Gyroscope_Magnitude
Mean_Frequency_Body_Acceleration_Axis_X
Mean_Frequency_Body_Acceleration_Axis_Y
Mean_Frequency_Body_Acceleration_Axis_Z
Mean_Frequency_Body_Acceleration_Jerk_Axis_X
Mean_Frequency_Body_Acceleration_Jerk_Axis_Y
Mean_Frequency_Body_Acceleration_Jerk_Axis_Z
Mean_Frequency_Body_Gyroscope_Axis_X
Mean_Frequency_Body_Gyroscope_Axis_Y
Mean_Frequency_Body_Gyroscope_Axis_Z
Mean_Frequency_Body_Acceleration_Magnitude
Mean_Frequency_Body_Acceleration_Jerk_Magnitude
Mean_Frequency_Body_Gyroscope_Magnitude
Mean_Frequency_Body_Jerk_Gyroscope_Magnitude
Standard_Deviation_Time_Body_Acceleration_Axis_X
Standard_Deviation_Time_Body_Acceleration_Axis_Y
Standard_Deviation_Time_Body_Acceleration_Axis_Z
Standard_Deviation_Time_Acceleration_Gravity_Axis_X
Standard_Deviation_Time_Acceleration_Gravity_Axis_Y
Standard_Deviation_Time_Acceleration_Gravity_Axis_Z
Standard_Deviation_Time_Body_Acceleration_Jerk_Axis_X
Standard_Deviation_Time_Body_Acceleration_Jerk_Axis_Y
Standard_Deviation_Time_Body_Acceleration_Jerk_Axis_Z
Standard_Deviation_Time_Body_Gyroscope_Axis_X
Standard_Deviation_Time_Body_Gyroscope_Axis_Y
Standard_Deviation_Time_Body_Gyroscope_Axis_Z
Standard_Deviation_Time_Body_Jerk_Gyroscope_Axis_X
Standard_Deviation_Time_Body_Jerk_Gyroscope_Axis_Y
Standard_Deviation_Time_Body_Jerk_Gyroscope_Axis_Z
Standard_Deviation_Time_Body_Acceleration_Magnitude
Standard_Deviation_Time_Acceleration_Gravity_Magnitude
Standard_Deviation_Time_Body_Acceleration_Jerk_Magnitude
Standard_Deviation_Time_Body_Gyroscope_Magnitude
Standard_Deviation_Time_Body_Jerk_Gyroscope_Magnitude
Standard_Deviation_Frequency_Body_Acceleration_Axis_X
Standard_Deviation_Frequency_Body_Acceleration_Axis_Y
Standard_Deviation_Frequency_Body_Acceleration_Axis_Z
Standard_Deviation_Frequency_Body_Acceleration_Jerk_Axis_X
Standard_Deviation_Frequency_Body_Acceleration_Jerk_Axis_Y
Standard_Deviation_Frequency_Body_Acceleration_Jerk_Axis_Z
Standard_Deviation_Frequency_Body_Gyroscope_Axis_X
Standard_Deviation_Frequency_Body_Gyroscope_Axis_Y
Standard_Deviation_Frequency_Body_Gyroscope_Axis_Z
Standard_Deviation_Frequency_Body_Acceleration_Magnitude
Standard_Deviation_Frequency_Body_Acceleration_Jerk_Magnitude
Standard_Deviation_Frequency_Body_Gyroscope_Magnitude
Standard_Deviation_Frequency_Body_Jerk_Gyroscope

