local_path=paste(getwd(),"/data.zip",sep = "")

if(!file.exists(local_path)){
  # download the dataset if not downloaded the zip or not present
  url <-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(url,local_path,method="curl")
  
  #unzip
  unzip(local_path)
  #Save memory
  rm("url")
}

# Merges the training and the test sets to create one data set
# -------------------------------------------------------------------
# Data paths
data_set_folder<-paste(getwd(),"/UCI HAR Dataset/",sep = "")
test<-paste(data_set_folder,'test/X_test.txt',sep = "")
train<-paste(data_set_folder,'train/X_train.txt',sep = "")

# Load data
data_test<-read.table(test,header = FALSE)
data_train<-read.table(train,header = FALSE)
merged_data<-merge(data_train,data_test,all=TRUE)

# Clean memory
rm("data_test", "data_train","local_path","test","train")

# Extracts only the measurements on the mean and standard deviation for each measurement.
# ------------------------------------------------------------------------------------------
# Read headers
headers <- read.table(paste(data_set_folder,"/features.txt",sep=""))
headers <- as.character(headers[,2])

# Get only std and mean headers
index_headers <- grep(".*std.*|.*mean.*", headers)
headers<-headers[index_headers]
merged_data<-merged_data[index_headers]

# Uses descriptive activity names to name the activities in the data set
# -----------------------------------------------------------------------------

# Load activities
data_test_ac<-read.table(paste(data_set_folder,'test/y_test.txt',sep = ""),header = FALSE)
data_train_ac<-read.table(paste(data_set_folder,'train/y_train.txt',sep = ""),header = FALSE)
cool_labels<-read.table(paste(data_set_folder,'activity_labels.txt',sep = ""),header = FALSE)
merged_activities<-rbind(data_train_ac,data_test_ac)

m_cool_labels<- as.matrix(cool_labels)
m_merged_activities<- as.matrix(merged_activities)
m_merged_activities[m_merged_activities==1] <- m_cool_labels[1,2]
m_merged_activities[m_merged_activities==2] <- m_cool_labels[2,2]
m_merged_activities[m_merged_activities==3] <- m_cool_labels[3,2]
m_merged_activities[m_merged_activities==4] <- m_cool_labels[4,2]
m_merged_activities[m_merged_activities==5] <- m_cool_labels[5,2]
m_merged_activities[m_merged_activities==6] <- m_cool_labels[6,2]
merged_activities <- as.data.frame(m_merged_activities)

#Save memory
rm("m_cool_labels", "cool_labels","m_merged_activities","data_test_ac","data_train_ac","index_headers")

# Appropriately labels the data set with descriptive variable names.
headers <-gsub('[()-]', '', headers)
headers <- gsub('std', 'Standard_deviation', headers)
headers <- gsub('mean', 'Mean', headers)
headers <- gsub('f', '', headers)
headers <- gsub('t', '', headers)

# From the data set in step 4, creates a second, independent tidy data set with the average of 
# each variable for each activity and each subject.
# ----------------------------------------------------------------------------------------------------

#Load subjects
subjects_test_path<-paste(data_set_folder,'test/subject_test.txt',sep = "")
subjects_train_path<-paste(data_set_folder,'train/subject_train.txt',sep = "")

test_subjects<-read.table(subjects_test_path,header = FALSE)
train_subjects<-read.table(subjects_train_path,header = FALSE)
merged_subjects<-merge(train_subjects,test_subjects,all=TRUE)

#Create new headers
headers <-c('Subject_ID','Activity',headers)

#Final merges
final_data<-cbind(merged_subjects,merged_activities,merged_data)
colnames(final_data)<-headers

#Clean
rm("merged_data","merged_activities","merged_subjects","subjects_train_path","subjects_test_path","headers","test_subjects","train_subjects")

# Create factors
final_data$Activity <- as.factor(final_data$Activity)
final_data$Subject_ID <- as.factor(final_data$Subject_ID)

# Obtain results (reshape2)
data_melted <- melt(final_data, id = c("Subject_ID", "Activity"))
report <- dcast(data_melted, Subject_ID + Activity ~ variable, mean)

#Save final results as csv
write.csv(report, "TIDY.txt",row.names = FALSE)




                  
