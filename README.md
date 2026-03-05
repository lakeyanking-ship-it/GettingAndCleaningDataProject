# GettingAndCleaningDataProject

Course project for Getting and Cleaning Data.

Project Summary
This repository contains the course project for the Getting and Cleaning Data course. The goal is to demonstrate the ability to collect, clean, and prepare data for analysis using the UCI Human Activity Recognition (HAR) Dataset.
The project produces a tidy dataset with the average of each measurement for each activity and each subject.

Files in This Repository
run_analysis.R — Script that performs all required data cleaning steps.
tidy_dataset.txt — Final tidy dataset created by the script.
CodeBook.md — Documentation of variables, data sources, and transformations.
README.md — Explanation of the project and how to run the analysis.

How to Run the Script
1. Download the raw dataset from the course website.
2. Unzip it into your working directory so the folder UCI HAR Dataset is present.
3. Place run_analysis.R in the same directory.
4. In RStudio, run: 
source("run_analysis.R")
5. The script will generate a file named tidy_dataset.txt in the working directory.

What the Script Does
The script performs the five required steps:
1. Merges the training and test sets.
2. Extracts only mean() and std() measurements.
3. Applies descriptive activity names.
4. Labels variables with descriptive names.
5. Creates a second tidy dataset with averages for each Subject–Activity pair.

Tidy Dataset Description
The final dataset contains:
One row per Subject–Activity combination
One column per averaged measurement
Clean, descriptive variable names
180 rows and 68 columns
This dataset is suitable for downstream statistical analysis or machine learning tasks.
