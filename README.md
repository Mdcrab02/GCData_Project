# GCData_Project

This repository contains the script, codebook, and tidy dataset for the final project of the 
Getting and Cleaning Data course offered on Coursera by Johns Hopkins University.

## Synopsis

Information from the UCI was used for analysis and is the result of an experiment where
volunteers performed various activities while wearing the Samsung Galaxy SII phone.  For
the purpose of further analysis, the data was split into test and training sets.  However,
for the course students were directed to merge the raw data and meta data into one large and
tidy dataset.  In addition to the transformations, the mean and standard deviation was calculated
for each subject's activity as a feature vector.

## Included Files

Included in the repository is this README file, the run_analysis script, and the codebook.

* README.md: explains the purpose of the repository and the files included.

* run_analysis.r: the script used to ingest, process, transform, and assemble the final dataset.

* GCD_Project_Codebook.md: the codebook explains the various transformations and calculations performed
as well as the variables created and used throughout the script.

* tidy.txt: the result of run_analysis.r which is the final tidy dataset created by the script.  Note that
it also contains the mean and standard deviations for each subject's activities.