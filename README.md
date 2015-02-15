# Getting and Cleaning Data: 
# Coursera Course Project

## Introduction
In this repository you will find all the relevant informtion that is part of the Final Project for the Getting and Cleaning Data on Coursera (John Hopkins University)

- CodeBook.md: Detail information of the Raw Data methodology and the Clean Data Set Variables
- run_analysis.R: Script for the transformation of the data
- tidy.txt: Final data set with the transformation and calculations as required by the project
- README.md: Step-by-step instructions of the data transformation

##Raw Data

Please refer to the CodeBook for detail information on the source and methodology of the Raw data.
The Raw data was provided in a series of .txt files divided between a "test" and "training" branches.  

##Script
The script called run_analysis.R does the following functions:

- It will merge the test and training sets together.
- It will read the labels file into the merged dataset
- Relabels the features so that they are easier to understand
- Creates a new dataset using only the Mean and Standard Deviation readings
- Groups the new data set by Activity and Subject
- Creates a tab delimited .txt file with the final output and stores it in the original folder (you can find that file on this repository under the name Clean Dataset.txt) 

Prerequisites for this script:

- the UCI HAR Dataset must be extracted 
- the UCI HAR Dataset must be availble in a directory called "UCI HAR Dataset"


##CodeBook
The CodeBook contains:

- Detailed information on the source of the raw data
- The methodology used to calculate the variables in the raw data
- The description of the variables in the Raw Data
- A description on the transformatin from the Raw to the Clean Data set
- The description of the variables in the Clean Data Set