library(data.table)
library(dplyr) 

#Download the data
url <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

download.file(url,destfile = "GCDdata.zip")

#Load up all of the different text files
actlabels <- read.table("./UCI HAR Dataset/activity_labels.txt", 
                         header=FALSE, colClasses="character")
features <- read.table("./UCI HAR Dataset/features.txt", 
                       header=FALSE, colClasses="character") 
test1 <- read.table("./UCI HAR Dataset/test/subject_test.txt", header=FALSE)
test2 <- read.table("./UCI HAR Dataset/test/X_test.txt", header=FALSE)
test3 <- read.table("./UCI HAR Dataset/test/y_test.txt", header=FALSE)
train1 <- read.table("./UCI HAR Dataset/train/subject_train.txt", header=FALSE)
train2 <- read.table("./UCI HAR Dataset/train/X_train.txt", header=FALSE)
train3 <- read.table("./UCI HAR Dataset/train/y_train.txt", header=FALSE)

#Check out the structure of each dataframe
str(test1)
str(test2)
str(test3)
str(train1)
str(train2)
str(train3)

#Transform numeric vectors into factors and associate the levels with the activites
#Calling this vector "Activity" for merging later
test3$V1 <- factor(test3$V1, levels=actlabels$V1, labels=actlabels$V2) 
train3$V1 <- factor(train3$V1, levels=actlabels$V1, labels=actlabels$V2) 
colnames(test3)<- c("Activity")
colnames(train3)<- c("Activity")

#Take the high dimensional train and test sets and assign their column names with
#the features from the zip file
str(features)
colnames(test2)<- features$V2 
colnames(train2)<- features$V2

#Assign these train and test vectors with name Subject
colnames(test1)<- c("Subject")
colnames(train1)<- c("Subject")

#Start to combine all of the test and train sets
big_train <- cbind(train1,train2,train3) 
big_test <- cbind(test1,test2,test3)

#Merge the test and train sets together
all_data <- rbind(big_train, big_test)

#The names for the features in the combined data set are not as easy to read
#Many contain abbreviations, expanding these out based on the metadata
names(all_data)
names(all_data)<-gsub("Acc", "Accelerometer", names(all_data))
names(all_data)<-gsub("Gyro", "Gyroscope", names(all_data))
names(all_data)<-gsub("BodyBody", "Body", names(all_data))
names(all_data)<-gsub("Mag", "Magnitude", names(all_data))
names(all_data)<-gsub("^t", "Time", names(all_data))
names(all_data)<-gsub("^f", "Frequency", names(all_data))
names(all_data)<-gsub("tBody", "TimeBody", names(all_data))
names(all_data)<-gsub("-mean()", "Mean", names(all_data), ignore.case = TRUE)
names(all_data)<-gsub("-std()", "STD", names(all_data), ignore.case = TRUE)
names(all_data)<-gsub("-freq()", "Frequency", names(all_data), ignore.case = TRUE)
names(all_data)<-gsub("angle", "Angle", names(all_data))
names(all_data)<-gsub("gravity", "Gravity", names(all_data))
names(all_data)

#Calculate the mean and standard deviations
all_means <- sapply(all_data, mean, na.rm=TRUE)
all_stdevs <- sapply(all_data, sd, na.rm=TRUE)

#Convert the combined data set into a data table
new_data <- data.table(all_data)
str(new_data)
class(new_data)

#Create the tidy dataset and add on the mean values
#for each subject's activities.  The "by =" removes the two from the calculation
tidy <- new_data[ ,lapply(.SD, mean), by = "Activity,Subject"]

#Write out the new tidy dataset!
write.table(tidy
            ,file="tidy.txt"
            ,sep=","
            ,row.names = FALSE)