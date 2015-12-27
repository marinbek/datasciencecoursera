# read labels
features <- read.table('UCI HAR Dataset/features.txt', col.names=c('id', 'label'))
activity_labels <- read.table('UCI HAR Dataset/activity_labels.txt', col.names=c('id', 'activity'))

# read test and train data, label it using features
test_data <- read.table('UCI HAR Dataset/test/X_test.txt', col.names=features$label, check.names=FALSE)
train_data <- read.table('UCI HAR Dataset/train/X_train.txt', col.names=features$label, check.names=FALSE)
all <- rbind(test_data, train_data)

# extract only columns containing "mean" and "std" in column names
filtered <- all[,grep("mean|std", colnames(all))]

# get activity and join it
test_activity <- read.table('UCI HAR Dataset/test/y_test.txt', check.names=FALSE)
train_activity <- read.table('UCI HAR Dataset/train/y_train.txt', check.names=FALSE)
all_activity <- rbind(test_activity, train_activity)

# get subject and join it
test_subject <- read.table('UCI HAR Dataset/test/subject_test.txt', check.names=FALSE)
train_subject <- read.table('UCI HAR Dataset/train/subject_train.txt', check.names=FALSE)
all_subjects <- rbind(test_subject, train_subject)

# add activity (numeric id) to all_data dataframe
filtered$activity_id <- all_activity$V1
filtered$subject <- all_subjects$V1

# make a new data frame which has descriptive activity names from activity_labels
all_data <- merge(filtered, activity_labels, by.x="activity_id", by.y="id")
all_data$activity_id <- NULL

cols <- colnames(all_data)
features <- cols[!cols %in% c("subject", "activity")]

# group data by "subject" and "activity", calculate mean for all other columns
tidy_data <- aggregate(x = all_data[, 1:(ncol(all_data)-2)], 
                 by = list(subject=all_data$subject,activity=all_data$activity), 
                 FUN = "mean", na.rm = T)

# Export the tidy dataset into a file
write.table(tidy_data, file="tidy_data.txt", row.name=FALSE)
