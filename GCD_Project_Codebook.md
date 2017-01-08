Code Book
================
Mdcrab02
January 8, 2017

This codebook explains the data used in the run\_analysis.r script in this repository and details the transformations performed on the data.

Data Used
---------

The data used in this analysis originates UCI where 30 volunteers between the ages of 19 and 48 wore Samsung Galaxy SII phones while performing various activities. The activities were: walking, walking upstairs, walking downstairs, sitting, standing, and lying down. While performing each of the activities, the phone's accelerometer and gyroscope recorded the triaxial linear acceleration and angular velocity. Each set of measurements was manually labeled through video observation.

More information from UCI regarding the data [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

The original data set can be found [here](http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

Data Transformation
-------------------

The raw data was read into R in separate pieces of the test and training sets. The information regarding the names of the activities and the measurements recorded is found within the features and activity\_labels data. This information is then applied to the numerical test and training set data wherein the dataset. Afterwards, the test and training sets are prepared to be merged into the large dataset all\_data.

After the merge, and to make the features a little easier to understand, their abbreviated names are expanded. For example, "Acc" was changed to "Accelerometer."

New Variables Introduced
------------------------

Throughout the analysis, a number of new variables were created in the environment. They are listed below by order of appearence in the script:

-   big\_train: the entire training dataset which resulted from combining subject\_train, x\_train, and y\_train.

-   big\_test: the entire test dataset which resulted from combining subject\_test, x\_test, and y\_test.

-   all\_data: all of the data furnished by UCI and the combination of big\_train and big\_test.

-   all\_means: the extracted mean of each feature vector of measurements.

-   all\_stdevs: the extracted standard deviation of each feature vector of measurements.

-   new\_data: the result of transforming the entire dataset, all\_data, into a data.table class.

-   tidy: the completed tidy data set with the application of both mean and standard deviation across each feature set grouped by activity and subject.
