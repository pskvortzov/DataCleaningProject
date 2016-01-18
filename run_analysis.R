run_analysis <- function() {
  ## Loading and extracting feature names
  featureData <- read.table('data/features.txt')
  featureNames <- featureData[,2]

  ## Loading and extracting activity labels
  activityData <- read.table('data/activity_labels.txt', colClasses = 'character')
  activityLabels <- activityData[,2]
  
  ## Loading training data and assigning appropriate names to columns
  trainData <- read.table('data/train/X_train.txt')
  colnames(trainData) <- featureNames;
  
  ## Loading subject data
  trainSubjects <- read.table('data/train/subject_train.txt', col.names = 'subject')

  ## Loading activities and making a factor using activity labels
  trainActivityLevels <- read.table('data/train/y_train.txt', col.names = 'activity', colClasses = 'numeric')
  trainActivities <- factor(trainActivityLevels[,1], levels = c(1, 2, 3, 4, 5, 6), labels = activityLabels)
  
  ## Final training data.frame
  trainAll <- cbind(trainSubjects, activity = trainActivities, trainData)
  
  ## Loading test data and assigning appropriate names to columns
  testData <- read.table('data/test/X_test.txt')
  colnames(testData) <- featureNames;
  
  ## Loading subject data
  testSubjects <- read.table('data/test/subject_test.txt', col.names = 'subject')

  ## Loading activities and making a factor using activity labels
  testActivityLevels <- read.table('data/test/y_test.txt', col.names = 'activity', colClasses = 'numeric')
  testActivities <- factor(testActivityLevels[,1], levels = c(1, 2, 3, 4, 5, 6), labels = activityLabels)
  
  ## Final test data.frame
  testAll <- cbind(testSubjects, activity = testActivities, testData)
  
  ## Combining training and test data
  allData <- rbind(trainAll, testAll)
  
  ## Extracting only subject, activity, mean and std column numbers (but not meanFreq)
  requiredColumns <- grep('mean\\(\\)|std\\(\\)|^subject$|^activity$', names(allData))
  
  ## Extracting these columns
  requiredData <- allData[,requiredColumns]
  
  ## Cleaning up column names a bit - removing () and replacing all "-" with a "."
  colnames(requiredData) <- gsub('\\(\\)', '', colnames(requiredData))
  colnames(requiredData) <- gsub('-', '.', colnames(requiredData))
  
  ## Creating aggregate data.frame with the average of each variable for each activity and each subject
  aggregateData <- aggregate(
    requiredData[,-(1:2)], 
    by = list(
      activity = requiredData$activity, 
      subject = requiredData$subject), 
    FUN = mean
  )
  
  ## Adding "average" to column names
  names(aggregateData) <- gsub('(tBody|fBody|tGravity)', 'average.\\1', names(aggregateData))
  
  ## Exporting aggregateData to a file
  write.table(aggregateData, 'tidy_data.txt', row.name = FALSE)
}