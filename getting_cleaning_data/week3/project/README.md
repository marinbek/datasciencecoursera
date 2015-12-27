Tidy dataset of Human Activity Recognition Using Smartphones Data Set 
=====================================================================

Enclosed script `run_analysis.R` takes data from "Human Activity Recognition Using Smartphones Data Set" [available here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) and consolidates and cleans it for further analysis.

Data is processed as follows:
1. Train and Test datasets are merged into one dataset
2. Only columns containing mean and standard deviation values are included (other columns are discarded)
3. Activity (descriptive text) for each observation is appended as a column of the dataset (column name: `activity`)
4. Subject of each observation is appended as a column to the dataset (column name: `subject`)
5. Data is tidied by grouping the whole dataset by subject and activity and calculating average value for all variables


## Using the script

First, download the data [from this link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and place it in the same folder with the `run_analysis.R` script. Extract the zip file.

Run the script.

File `tidy_data.txt` should appear in the same folder after successfully running the script.