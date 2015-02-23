# Code Book

## Description

# 1) Merges the training and the test sets to create one data set.
The command `rbind` is used on the resulting merged data is named `all.set`

# 2) Extracts only the measurements on the mean and standard deviation for each measurement. 
A regular expression is used to find all the features containing the strings "mean()" or "std()".
The associated indices are then used to filter the merged data and only select the relevant features.

# 3) Uses descriptive activity names to name the activities in the data set.
The activities are added to the merged data. Then they are transformed as factors
and renamed, using the content of the file `activity_labels.txt`

# 4) Appropriately labels the data set with descriptive variable names.
We select only the feature names as according to the previous selection (cf step 2)
and remove parentheses from the associated names.
These new names are then used to rename the columns of the merged data.
Since we added the last column activities, we also added the name "activities" at the end.
