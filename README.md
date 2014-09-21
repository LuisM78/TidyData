TidyData
========

Introduction

Course Project

The run_analysis.R script loads and process data to create a clean or tidy/data 
set from an experiment that measures parameters from an accelerometer 
and gyroscope installed in smartphones. The data was taken for 30 individuals.
About 70% of the data was taken for training and the other 30% for testing 
a machine learning algorythim for human activity recognition. 
 
The scripts assumes the data has previously been donwloaded from the internet and unzipped
in order to run, the script needs to be in the working directory where the files are available.

IMPORTANT: It also uses the plyr library. Please install before running!!!.

The data is from the following paper:
  
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz.
Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly 
Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012).
Vitoria-Gasteiz, Spain. Dec 2012

The process can be summarized as following steps

*The data sets are loaded as objects in R
* A big data set is created merging the loaded data.
  This corresponds to Step 1 of the assigment Element list 1
* THe features labels are loaded into R