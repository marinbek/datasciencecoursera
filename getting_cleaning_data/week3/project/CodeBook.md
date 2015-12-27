Tidy dataset of Human Activity Recognition Using Smartphones Data Set 
=====================================================================

Data from Human Activity Recognition database (found here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) is consolidated and tidied using script found in this repository (run_analysis.R).

Generated dataset is stored as `tidy_data.txt`.

Dataset contains 81 columns, first two are:
- `subject` - ID of test subject, ranging from 1-30
- `activity` - Textual activity description, one of the 6 possibilities: `LAYING` `SITTING` `STANDING` `WALKING` `WALKING_DOWNSTAIRS` `WALKING_UPSTAIRS`

Next 79 columns contain mean and standard deviation values of following metrics:
- `tBodyAcc-XYZ`
- `tGravityAcc-XYZ`
- `tBodyAccJerk-XYZ`
- `tBodyGyro-XYZ`
- `tBodyGyroJerk-XYZ`
- `tBodyAccMag`
- `tGravityAccMag`
- `tBodyAccJerkMag`
- `tBodyGyroMag`
- `tBodyGyroJerkMag`
- `fBodyAcc-XYZ`
- `fBodyAccJerk-XYZ`
- `fBodyGyro-XYZ`
- `fBodyAccMag`
- `fBodyAccJerkMag`
- `fBodyGyroMag`
- `fBodyGyroJerkMag`
- `gravityMean`
- `tBodyAccMean`
- `tBodyAccJerkMean`
- `tBodyGyroMean`
- `tBodyGyroJerkMean`

Sets of above variable values are denoted with the following:
- `mean()` Mean value
- `std()` Standard deviation