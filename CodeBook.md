CodeBook
========


This is a description of the variables, data and transformation to clean up the data.

First, the original (raw), data was taken from the following address:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

After being downloaded, the original description of the files was read from

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The original descriptions are in the files:

* README.txt
* activity_labels.txt
* features.txt
* features_info.txt


The data is taken from the accelerometer and gyroscope that are installed in smartphones and is collected for 30 people doing 6 different activities. 

The merged data set (train&test) contained 563 variables with 10299 observations. It was composed of the following files: X_test.txt, y_test.txt, subject_test.txt, X_train.txt, y_train.txt, subject_train.txt.

From the merged data set, the variables that contained the: "mean","std" in their names were extracted using regular expressions. These were 86 in total. Another two variables to include the yvalues and the subject columns were added to the data set. The variables names were also treated to eliminate any dashes (-),parenthesis "()". All the variables names were also converted to lowercase. 
For the activity labels, they were changed from the corresponding integer
1, 2, 3, 4,5,6 to the corresponding activity using the following descriptive names:

1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING

They were also converted using gsub, to eliminate the undescore and to lower their case and  looked like this
* walking
* walkingupstairs
* walkingdownstairs
* sitting
* standing
* laying

Finally, the averages (mean), values of the corresponding subject and for each activity were computed for each of the variables.

The final variables in the tidy data correspond to the following:

* Column Names (88 in total)

    * yvalues    # Correspond to the activity column
    * subject    # Correspond to the subject
    * mean(tbodyaccmeanx)
    * mean(tbodyaccmeany)
    * mean(tbodyaccmeanz)
    * mean(tbodyaccstdx)
    * mean(tbodyaccstdy)
    * mean(tbodyaccstdz)
    * mean(tgravityaccmeanx)
    * mean(tgravityaccmeany)
    * mean(tgravityaccmeanz)
    * mean(tgravityaccstdx)
    * mean(tgravityaccstdy)
    * mean(tgravityaccstdz)
    * mean(tbodyaccjerkmeanx)
    * mean(tbodyaccjerkmeany)
    * mean(tbodyaccjerkmeanz)
    * mean(tbodyaccjerkstdx)
    * mean(tbodyaccjerkstdy)
    * mean(tbodyaccjerkstdz)
    * mean(tbodygyromeanx)
    * mean(tbodygyromeany)
    * mean(tbodygyromeanz)
    * mean(tbodygyrostdx)
    * mean(tbodygyrostdy)
    * mean(tbodygyrostdz)
    * mean(tbodygyrojerkmeanx)
    * mean(tbodygyrojerkmeany)
    * mean(tbodygyrojerkmeanz)
    * mean(tbodygyrojerkstdx)
    * mean(tbodygyrojerkstdy)
    * mean(tbodygyrojerkstdz)
    * mean(tbodyaccmagmean)
    * mean(tbodyaccmagstd)
    * mean(tgravityaccmagmean)
    * mean(tgravityaccmagstd)
    * mean(tbodyaccjerkmagmean)
    * mean(tbodyaccjerkmagstd)
    * mean(tbodygyromagmean)
    * mean(tbodygyromagstd)
    * mean(tbodygyrojerkmagmean)
    * mean(tbodygyrojerkmagstd)
    * mean(fbodyaccmeanx)
    * mean(fbodyaccmeany)
    * mean(fbodyaccmeanz)
    * mean(fbodyaccstdx)
    * mean(fbodyaccstdy)
    * mean(fbodyaccstdz)
    * mean(fbodyaccmeanfreqx)
    * mean(fbodyaccmeanfreqy)
    * mean(fbodyaccmeanfreqz)
    * mean(fbodyaccjerkmeanx)
    * mean(fbodyaccjerkmeany)
    * mean(fbodyaccjerkmeanz)
    * mean(fbodyaccjerkstdx)
    * mean(fbodyaccjerkstdy)
    * mean(fbodyaccjerkstdz)
    * mean(fbodyaccjerkmeanfreqx)
    * mean(fbodyaccjerkmeanfreqy)
    * mean(fbodyaccjerkmeanfreqz)
    * mean(fbodygyromeanx)
    * mean(fbodygyromeany)
    * mean(fbodygyromeanz)
    * mean(fbodygyrostdx)
    * mean(fbodygyrostdy)
    * mean(fbodygyrostdz)
    * mean(fbodygyromeanfreqx)
    * mean(fbodygyromeanfreqy)
    * mean(fbodygyromeanfreqz)
    * mean(fbodyaccmagmean)
    * mean(fbodyaccmagstd)
    * mean(fbodyaccmagmeanfreq)
    * meanfbodybodyaccjerkmagmean)
    * mean(fbodybodyaccjerkmagstd)
    * mean(fbodybodyaccjerkmagmeanfreq)
    * mean(fbodybodygyromagmean)
    * mean(fbodybodygyromagstd)
    * mean(fbodybodygyromagmeanfreq)
    * mean(fbodybodygyrojerkmagmean)
    * mean(fbodybodygyrojerkmagstd)
    * mean(fbodybodygyrojerkmagmeanfreq)
    * mean(angletbodyaccmeangravity)
    * mean(angletbodyaccjerkmeangravitymean)
    * mean(angletbodygyromeangravitymean)
    * mean(angletbodygyrojerkmeangravitymean)
    * mean(anglexgravitymean)
    * mean(angleygravitymean)
    * mean(anglezgravitymean)
