# Code Book

## Description

# 1) Merges the training and the test sets to create one data set.
The command `rbind` is used on the resulting merged data is named `all.set`

# 2) Extracts only the measurements on the mean and standard deviation for each measurement. 
A regular expression is used to find all the features containing the strings "mean()" or "std()".
The associated indices are then used to filter the merged data and only select the relevant features.

# 3) Uses descriptive activity names to name the activities in the data set.
The activities are added as factors to the merged data in a new column `activities`.
Then the data frame columns are renamed, using the content of the file `activity_labels.txt`

# 4) Appropriately labels the data set with descriptive variable names.
We select only the feature names as according to the previous selection (cf step 2)
and remove parentheses from the associated names.
These new names are then used to rename the columns of the merged data, without
forgetting the `activities` we just added in the previous step.

# 5) From the data set in step 4, creates a second, independent tidy data set with 
# the average of each variable for each activity and each subject.
The subjects indices are read from the files `subject_train.txt` and `subject_test.txt`,
merged, and added to the data frame as factors in a new column `subjects`.
The aggregate command is used to calculate the mean grouped by `subjects` and
`activities`, of all other variables (`.` in the formula)
Finally, the resulting data frame is save locally under the name `meanstd_avg_by_SubjectActivity.txt`
