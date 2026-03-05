Overview
This code book describes the data, variables, and transformations used to create the final tidy dataset for the Getting and Cleaning Data course project. The project uses data from the UCI Human Activity Recognition (HAR) Dataset, which contains smartphone accelerometer and gyroscope measurements collected from 30 volunteers performing six activities.

Raw Data Description

The raw dataset includes:
Sensor signals from the Samsung Galaxy S smartphone
Accelerometer and gyroscope measurements
Time‑domain and frequency‑domain variables
Training and test partitions
Activity labels and subject identifiers

Raw files used:
features.txt — Names of all measurement variables
activity_labels.txt — Mapping of activity codes to descriptive names
train/ and test/ folders containing:
X_train.txt, X_test.txt — Sensor measurements
y_train.txt, y_test.txt — Activity codes
subject_train.txt, subject_test.txt — Subject identifiers

Transformations Performed
The run_analysis.R script performs the following steps:

Merged training and test sets into one dataset.
Extracted only mean() and std() variables using pattern matching on feature names.
Replaced activity codes with descriptive names from activity_labels.txt.

Cleaned and expanded variable names to improve readability:
t → Time
f → Frequency
Acc → Accelerometer
Gyro → Gyroscope
Mag → Magnitude
BodyBody → Body
Created a second tidy dataset containing the average of each variable for each activity and each subject.
Wrote the final dataset to tidy_dataset.txt.

Final Dataset Structure
The final tidy dataset contains:
180 rows (30 subjects × 6 activities)
68 columns (Subject, Activity, and 66 averaged measurement variables)
Each row represents a unique Subject–Activity combination.

Variable Descriptions
Identifier Variables
Subject — Integer from 1 to 30 identifying the volunteer.
Activity — One of six descriptive activity names:
WALKING
WALKING_UPSTAIRS
WALKING_DOWNSTAIRS
SITTING
STANDING
LAYING

Measurement Variables
All remaining variables represent the average of the original mean() or std() measurements for each Subject–Activity pair.

Examples:
TimeBodyAccelerometerMeanX
TimeBodyAccelerometerStdY
FrequencyBodyGyroscopeMeanZ
TimeGravityAccelerometerMagnitudeMean
FrequencyBodyAccelerometerJerkMagnitudeStd

Units:
Accelerometer measurements: g (standard gravity)
Gyroscope measurements: radians per second
Magnitude variables: Euclidean norm of the signal
Time variables: time‑domain signals
Frequency variables: FFT‑transformed signals
All variables are numeric.