#Getting and Cleaning Data Course Project CodeBook

##The site where all data was retreived: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
##The data for the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

##The run_analysis script performs the following steps and uses the following variables.
###1. Read X_train.txt, y_train.txt, and subject_train.txt from the ./RunData/train folder and store into the variables trainData, trainLabel, and trainSubject.
###2. Read X_test.txt, y_test.txt, and subject_test.txt from the ./RunData/test folder and stores them into variables testData, testLabel, and testSubject.
###3. Combine testData and trainData into a data frame called joinData. Do the same for all other data sets; testLabel and trainLabel becomes joinLabel, and testSubject and testLabel become joinSubject.
###4. The next step is to read in the features.txt file from the ./RunData folder and store it into a variable named features. Only the mean and standard deviations are extracted. This resulting set is set to the variable joinData.
###5. In order to allow analysis, the columns names need to changed. The () and - symbols are removed, mean and std are also capitalized.
###6. Read the activity_labels.txt file from the ./RunData folder and save the data into a variable named activity. Once it is read in, clean up the column names so that it can be easily read. Underscores are removed and the resulting words are put into camel-back formation.
###7. Transform the values of joinLabel to match the activity data frame.
###8. Combine the joinSubject, joinLabel, and joinData into a data frame titled cleanedData. The first two columns need to be renamed subject and activity, respectively.
###9. The cleanedData data frame must now be written to merged_data.txt. It will be saved into the working directory.
###10. Create a second tidy data set that contains the averages of each measurement for each activty and subject. Calculate the mean for each combination. Finally, write the resulting data frame into data_with_means.txt.