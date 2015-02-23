# 1) Merges the training and the test sets to create one data set.
train.set<-read.table(file.path('train','X_train.txt'))
test.set<-read.table(file.path('test','X_test.txt'))
all.set<-rbind(train.set,test.set)

# 2) Extracts only the measurements on the mean and standard deviation for each measurement. 
features<-read.table('features.txt')
is.feature.mean_or_std<-grepl("*mean\\(\\)*|*std\\(\\)*",features[,2])
meanstd_set<-all.set[,is.feature.mean_or_std]

# 3) Uses descriptive activity names to name the activities in the data set.
activity.labels<-read.table('activity_labels.txt')
train.activities<-read.table(file.path('train','y_train.txt'))
test.activities<-read.table(file.path('test','y_test.txt'))
all.activities<-rbind(train.activities,test.activities)
meanstd_set$activities <- factor(as.factor(all.activities[,1]),levels = activity.labels[,1],
                                 labels = as.character(activity.labels[,2]))

# 4) Appropriately labels the data set with descriptive variable names.
features.mean_or_std<-features[is.feature.mean_or_std,2]
colnames(meanstd_set)<-c(gsub("\\(|\\)","",features.mean_or_std),"activities")

# 5) From the data set in step 4, creates a second, independent tidy data set with 
# the average of each variable for each activity and each subject.
train.subjects<-read.table(file.path('train','subject_train.txt'))
test.subjects<-read.table(file.path('test','subject_test.txt'))
all.subjects<-rbind(train.subjects,test.subjects)
meanstd_set$subjects<-as.factor(all.subjects[,1])
meanstd.avg.by.sbj_act<-aggregate(. ~ subjects + activities, data = meanstd_set, mean)
write.table(meanstd.avg.by.sbj_act,file='meanstd_avg_by_SubjectActivity.txt',row.name=FALSE)
