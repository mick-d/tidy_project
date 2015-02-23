# Merges the training and the test sets to create one data set.
train.set<-read.table(file.path('train','X_train.txt'))
test.set<-read.table(file.path('test','X_test.txt'))
all.set<-rbind(train.set,test.set)

# Extracts only the measurements on the mean and standard deviation for each measurement. 
features<-read.table('features.txt')
is.feature.mean_or_std<-grepl("*mean\\(\\)*|*std\\(\\)*",features[,2])
meanstd_set<-all.set[,is.feature.mean_or_std]

# Uses descriptive activity names to name the activities in the data set.
activity.labels<-read.table('activity_labels.txt')
train.activities<-read.table(file.path('train','y_train.txt'))
test.activities<-read.table(file.path('test','y_test.txt'))
all.activities<-rbind(train.activities,test.activities)
meanstd_set$activities <- factor(as.factor(all.activities[,1]),levels = activity.labels[,1],
                                 labels = as.character(activity.labels[,2]))

# Appropriately labels the data set with descriptive variable names.
features.mean_or_std<-features[is.feature.mean_or_std,2]
colnames(meanstd_set)<-c(gsub("\\(|\\)","",features.mean_or_std),"activities")
