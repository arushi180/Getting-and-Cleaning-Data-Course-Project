##loading data
x_Test<-read.table("./test/X_test.txt", header=TRUE)
y_Test<-read.table("./test/y_test.txt", header=TRUE)
subject_Test<-read.table("./test/subject_test.txt", header=TRUE)
x_Train<-read.table("./train/X_train.txt", header=TRUE)
y_Train<-read.table("./train/y_train.txt", header=TRUE)
subject_Train<-read.table("./train/subject_train.txt", header=TRUE)
##row binding
names(x_Train)<-names(x_Test)
combinedData<-rbind(x_Test,x_Train)
features<-read.table("./features.txt")
names(combinedData)<-features$V2
##selecting columns having std or mean
columnsNeeded<-grep("std()|mean()", names(combinedData))
combinedData<-combinedData[,columnsNeeded]
##ading Activity Names
for(i in 1:length(y_Test$X5)){
  if(y_Test$X5[i]==1)
    y_Test$ActivityNames[i]= "Walking"
  if(y_Test$X5[i]==2)
    y_Test$ActivityNames[i]= "Walking_Upstairs"
  if(y_Test$X5[i]==3)
    y_Test$ActivityNames[i]= "Walking_Downstairs"
  if(y_Test$X5[i]==4)
    y_Test$ActivityNames[i]= "Sitting"
  if(y_Test$X5[i]==5)
    y_Test$ActivityNames[i]= "Standing"
  if(y_Test$X5[i]==6)
    y_Test$ActivityNames[i]= "Laying"         
}
##adding Activity Names
for(i in 1:length(y_Train$X5)){
  if(y_Train$X5[i]==1)
    y_Train$ActivityNames[i]= "Walking"
  if(y_Train$X5[i]==2)
    y_Train$ActivityNames[i]= "Walking_Upstairs"
  if(y_Train$X5[i]==3)
    y_Train$ActivityNames[i]= "Walking_Downstairs"
  if(y_Train$X5[i]==4)
    y_Train$ActivityNames[i]= "Sitting"
  if(y_Train$X5[i]==5)
    y_Train$ActivityNames[i]= "Standing"
  if(y_Train$X5[i]==6)
    y_Train$ActivityNames[i]= "Laying"         
}
##row binding
activityNamesData<-rbind(y_Test,y_Train)
##adding the Activity Name column 
combinedData<-cbind(activityNamesData$ActivityNames,combinedData)
##creating subject data
names(subject_Test)<-names(subject_Train)
subjectsData<-rbind(subject_Test,subject_Train)
names(subjectsData)<-c("Subject")
combinedData<-cbind(subjectsData$Subject,combinedData)
##creating the dataset
finalData<-rbind(x_Test,x_Train)
names(finalData)<-features$V2
finalData<-cbind(activityNamesData$ActivityNames,finalData)
finalData<-cbind(subjectsData$Subject,finalData)
##calculating mean
answer<-aggregate(finalData[,3:ncol(finalData)], list(subject=finalData[,1], Activity=finalData[,2]),mean)
write.table(answer, file="./data.txt", row.name=FALSE)
