TidyData
========

Introduction

This is the Final Course Project for Getting and Cleaning Data coursera course.

The run_analysis.R script loads and process data to create a clean or tidy/data 
set from an experiment that measures parameters from an accelerometer 
and gyroscope installed in smartphones. The data was taken for 30 individuals.
About 70% of the data was taken for training and the other 30% for testing 
a machine learning algorythim for human activity recognition. 
 
The scripts assumes the data has previously been donwloaded from the internet and unzipped.
In order to run, the script needs to be in the working directory where the files are available.

IMPORTANT: It also uses the plyr library. Please install before running!!!.

The data is from the following paper:
  
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz.
Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly 
Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012).
Vitoria-Gasteiz, Spain. Dec 2012

The process can be summarized as following steps

* The data sets are loaded as objects in R
* A big data set is created merging the loaded data.
  This corresponds to Step 1 of the assigment Element list 1
* The features.txt file labels are loaded into R.
* The activity labels are loaded into R.
* The labels are changed to lower case and any dash (-) symbols are removed, to comply
  with clean data conventions.
* Two new rows are added to the features to include the new names (yvalues/subject) in  the bigdata frame.
* The column names are assigned, but first, all the string cases are set to lower!
* Using regular expressions, the the mean, standard deviation (std),
  the yvalues and the subject columns in the names vector of bigdata data frame
  to create a new "reduced" data frame called tidy. 
  This corresponds to step 2 in the assingment.
* The activity labels are changed to strings.
  This corresponds to step 3 in the assignment.
* Now the names in the column header of the tidy data set are 
  treated with gsub to have better descriptive variable names
  Regular expresions are use to eliminate the -, () and commas, 
  This corresponds to step 4 of the assigment.
* From the data set created in step 4, a new data set is created with the averages of each    
  variable for each activity and each subject.  The dddply command is used for this.
  This corresponds to the last step(5) of the assigment.
* Finally the cleaned/tidy data is saved into "tidydata.txt" in the working directory

Each step has been clearly commented in the run_analysis.R file.

For a description of the variables in the tidy data set, look into the CodeBook.md file.





