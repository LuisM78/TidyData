# The Following script loads and process data to create a clean or tidy/data 
# set from an experiment that measures parameters from an accelerometer 
# and gyroscope installed in smartphones. The data was taken for 30 individuals.
# About 70% of the data was taken for training and the other 30% for testing 
# a machine learning algorythim for human activity recognition. 
# 
# The scripts assumes the data has previously been donwloaded from the internet and unzipped
# in order to run, the script needs to be in the working directory where the files are available.

# IMPORTANT: It also uses the plyr library. Please install before running!!!.

## The data is from the following paper:
#  
# Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz.
# Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly 
# Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012).
# Vitoria-Gasteiz, Spain. Dec 2012


#  The data sets are loaded as objects in R

x_test <- read.table("./getdata_projectfiles_UCI HAR Dataset//UCI HAR Dataset/test/X_test.txt",header=FALSE, sep="")
y_test <- read.table("./getdata_projectfiles_UCI HAR Dataset//UCI HAR Dataset/test/y_test.txt",header=FALSE, sep="")
subject_test <- read.table("./getdata_projectfiles_UCI HAR Dataset//UCI HAR Dataset/test/subject_test.txt",header=FALSE, sep="")
xtestlabeled <-cbind(x_test,y_test,subject_test)

x_train <- read.table("./getdata_projectfiles_UCI HAR Dataset//UCI HAR Dataset//train/X_train.txt",header=FALSE,sep="")
y_train <- read.table("./getdata_projectfiles_UCI HAR Dataset//UCI HAR Dataset//train/y_train.txt",header=FALSE,sep="")
subject_train <- read.table("./getdata_projectfiles_UCI HAR Dataset//UCI HAR Dataset//train/subject_train.txt",header=FALSE,sep="")

xtrainlabeled <- cbind(x_train,y_train,subject_train)

# A big data set is created merging the loaded data
# This corresponds to Step 1 of the assigment

bigdata <- rbind(xtrainlabeled,xtestlabeled)  ## merges the data together

# THe features labels are loaded into R

features <- read.table("./getdata_projectfiles_UCI HAR Dataset//UCI HAR Dataset//features.txt",header=FALSE,sep="",stringsAsFactors=FALSE)


# The activity labels are loaded into R

activity_labels <- read.table("./getdata_projectfiles_UCI HAR Dataset//UCI HAR Dataset//activity_labels.txt",header=FALSE,sep="")

# The labels are changed to lower case and any - symbols are removed.

activity_labels$V2 <-tolower(activity_labels$V2)
activity_labels$V2 <-gsub("_","",activity_labels$V2)

# Two new rows are adeded to the features to include the new names in  the bigdata frame.
yvalues2 <- c(562,as.character("yvalues"))
features1 <- rbind(features,yvalues2)
yvalues3 <- c(563,as.character("subject"))
features2 <- rbind(features1,yvalues3)

# Assigning features to a vector of names.

names <- features2$V2



library(plyr)

# the column names are assigned, but first the all the string cases are set to lower!
colnames(bigdata) <- tolower(names)
length(names(bigdata))

# Using regular exprestions, the the mean, standard deviation (std),
# the yvalues and the subject columns in the names vector of bigdata data frame
# to create a new "reduced" data frame called tidy
# This corresponds to step 2 in the assingment

tidy <- bigdata[grep("mean|std|yvalues|subject",names(bigdata))] 

# Now the activity labels are changed to strings 
# Corresponds to step 3 in the assingment

tidy$yvalues<-as.integer(tidy$yvalues)
tidy$yvalues[tidy$yvalues=="1"]<- activity_labels$V2[1]
tidy$yvalues[tidy$yvalues=="2"]<- activity_labels$V2[2]
tidy$yvalues[tidy$yvalues=="3"]<- activity_labels$V2[3]
tidy$yvalues[tidy$yvalues=="4"]<- activity_labels$V2[4]
tidy$yvalues[tidy$yvalues=="5"]<- activity_labels$V2[5]
tidy$yvalues[tidy$yvalues=="6"]<- activity_labels$V2[6]



# Now the names in the column header of the tidy data set are 
# treated with gsub to have better descriptive variable names
# Regular expresions are use to eliminate the -, () and commas, 
# This corresponds to step 4 of the assigment.


namest <-names(tidy)
names2t<-gsub("-","",namest)
names3t<-gsub(")","",names2t)
names4t<-gsub("\\(","",names3t)
names5t <- gsub(",","",names4t)

names(tidy) <- names5t
variables <- names5t[!names(tidy) %in% c("yvalues","subject")]

# The follwing scripts is used to create the names to extract
# the parameters later on
stringsl=vector()

for (i in 1:88){
  stringsl[i]=paste("mean=", "mean(",variables[i],")",sep="")
  string2 = print(stringsl[i])

}


# From the data set created in step 4, 
# A new data set is created with the averages of each variable for each activity and each subject
# The dddply command is used for that
# This corresponds to the last step 5.

df5<-ddply(tidy,.(yvalues,subject),summarize, meantbodyaccmeanx=mean(tbodyaccmeanx)
          ,meantbodyaccmeany=mean(tbodyaccmeany)
          ,meantbodyaccmeanz=mean(tbodyaccmeanz)
          ,meantbodyaccstdx=mean(tbodyaccstdx)
          ,meantbodyaccstdy=mean(tbodyaccstdy)
          ,meantbodyaccstdz =mean(tbodyaccstdz)
          ,meantgravityaccmeanx=mean(tgravityaccmeanx)
          ,meantgravityaccmeany=mean(tgravityaccmeany)
          ,meantgravityaccmeanz=mean(tgravityaccmeanz)
          ,meantgravityaccstdx=mean(tgravityaccstdx)
          ,meantgravityaccstdy=mean(tgravityaccstdy)
          ,meantgravityaccstdz=mean(tgravityaccstdz)
          ,meantbodyaccjerkmeanx=mean(tbodyaccjerkmeanx)
          ,meantbodyaccjerkmeany=mean(tbodyaccjerkmeany)
          ,meantbodyaccjerkmeanz=mean(tbodyaccjerkmeanz)
          ,meantbodyaccjerkstdx=mean(tbodyaccjerkstdx)
          ,meantbodyaccjerkstdy=mean(tbodyaccjerkstdy)
          ,meantbodyaccjerkstdz=mean(tbodyaccjerkstdz)
          ,meantbodygyromeanx=mean(tbodygyromeanx)
          ,meantbodygyromeany=mean(tbodygyromeany)
          ,meantbodygyromeanz=mean(tbodygyromeanz)
          ,meantbodygyrostdx=mean(tbodygyrostdx)
          ,meantbodygyrostdy=mean(tbodygyrostdy)
          ,meantbodygyrostdz=mean(tbodygyrostdz)
          ,meantbodygyrojerkmeanx=mean(tbodygyrojerkmeanx)
          ,meantbodygyrojerkmeany=mean(tbodygyrojerkmeany)
          ,meantbodygyrojerkmeanz=mean(tbodygyrojerkmeanz)
          ,meantbodygyrojerkstdx=mean(tbodygyrojerkstdx)
          ,meantbodygyrojerkstdy=mean(tbodygyrojerkstdy)
          ,meantbodygyrojerkstdz=mean(tbodygyrojerkstdz)
          ,meantbodyaccmagmean=mean(tbodyaccmagmean)
          ,meantbodyaccmagstd=mean(tbodyaccmagstd)
          ,meantgravityaccmagmean=mean(tgravityaccmagmean)
          ,meantgravityaccmagstd=mean(tgravityaccmagstd)
          ,meantbodyaccjerkmagmean=mean(tbodyaccjerkmagmean)
          ,meantbodyaccjerkmagstd=mean(tbodyaccjerkmagstd)
          ,meantbodygyromagmean=mean(tbodygyromagmean)
          ,meantbodygyromagstd=mean(tbodygyromagstd)
          ,meantbodygyrojerkmagmean=mean(tbodygyrojerkmagmean)
          ,meantbodygyrojerkmagstd=mean(tbodygyrojerkmagstd)
          ,meanfbodyaccmeanx=mean(fbodyaccmeanx)
          ,meanfbodyaccmeany=mean(fbodyaccmeany)
          ,meanfbodyaccmeanz=mean(fbodyaccmeanz)
          ,meanfbodyaccstdx=mean(fbodyaccstdx)
          ,meanfbodyaccstdy=mean(fbodyaccstdy)
          ,meanfbodyaccstdz=mean(fbodyaccstdz)
          ,meanfbodyaccmeanfreqx=mean(fbodyaccmeanfreqx)
          ,meanfbodyaccmeanfreqy=mean(fbodyaccmeanfreqy)
          ,meanfbodyaccmeanfreqz=mean(fbodyaccmeanfreqz)
          ,meanfbodyaccjerkmeanx=mean(fbodyaccjerkmeanx)
          ,meanfbodyaccjerkmeany=mean(fbodyaccjerkmeany)
          ,meanfbodyaccjerkmeanz=mean(fbodyaccjerkmeanz)
          ,meanfbodyaccjerkstdx=mean(fbodyaccjerkstdx)
          ,meanfbodyaccjerkstdy=mean(fbodyaccjerkstdy)
          ,meanfbodyaccjerkstdz=mean(fbodyaccjerkstdz)
          ,meanfbodyaccjerkmeanfreqx=mean(fbodyaccjerkmeanfreqx)
          ,meanfbodyaccjerkmeanfreqy=mean(fbodyaccjerkmeanfreqy)
          ,meanfbodyaccjerkmeanfreqz=mean(fbodyaccjerkmeanfreqz)
          ,meanfbodygyromeanx=mean(fbodygyromeanx)
          ,meanfbodygyromeany=mean(fbodygyromeany)
          ,meanfbodygyromeanz=mean(fbodygyromeanz)
          ,meanfbodygyrostdx=mean(fbodygyrostdx)
          ,meanfbodygyrostdy=mean(fbodygyrostdy)
          ,meanfbodygyrostdz=mean(fbodygyrostdz)
          ,meanfbodygyromeanfreqx=mean(fbodygyromeanfreqx)
          ,meanfbodygyromeanfreqy=mean(fbodygyromeanfreqy)
          ,meanfbodygyromeanfreqz=mean(fbodygyromeanfreqz)
          ,meanfbodyaccmagmean=mean(fbodyaccmagmean)
          ,meanfbodyaccmagstd=mean(fbodyaccmagstd)
          ,meanfbodyaccmagmeanfreq=mean(fbodyaccmagmeanfreq)
          ,meanfbodybodyaccjerkmagmean=mean(fbodybodyaccjerkmagmean)
          ,meanfbodybodyaccjerkmagstd=mean(fbodybodyaccjerkmagstd)
          ,meanfbodybodyaccjerkmagmeanfreq=mean(fbodybodyaccjerkmagmeanfreq)
          ,meanfbodybodygyromagmean=mean(fbodybodygyromagmean)
          ,mean=mean(fbodybodygyromagstd)
          ,meanfbodybodygyromagstd=mean(fbodybodygyromagmeanfreq)
          ,meanfbodybodygyrojerkmagmean=mean(fbodybodygyrojerkmagmean)
          ,meanfbodybodygyrojerkmagstd=mean(fbodybodygyrojerkmagstd)
          ,meanfbodybodygyrojerkmagmeanfreq=mean(fbodybodygyrojerkmagmeanfreq)
          ,meanangletbodyaccmeangravity=mean(angletbodyaccmeangravity)
          ,meanangletbodyaccjerkmeangravitymean=mean(angletbodyaccjerkmeangravitymean)
          ,meanangletbodygyromeangravitymean=mean(angletbodygyromeangravitymean)
          ,meanangletbodygyrojerkmeangravitymean=mean(angletbodygyrojerkmeangravitymean)
          ,meananglexgravitymean=mean(anglexgravitymean)
          ,meanangleygravitymean=mean(angleygravitymean)
          ,meananglezgravitymean=mean(anglezgravitymean))

# Finally the cleaned/tidy data is saved into "tidydata.txt" in the working directory

write.table(df5,file="tidydata.txt",sep=",",row.names=FALSE)
