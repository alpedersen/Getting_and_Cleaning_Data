# Getting_and_Cleaning_Data
This file describes how run_analysis.R script works.

1. Unzip the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
and rename the folder with "RunData". Make sure the folder "RunData" and the run_analysis.R script are both 
in the current working directory.
2. Use source("run_analysis.R") command in RStudio.
3. Locate the two output files that were generated in the current working directory: merged_data.txt and data_with_means.txt 
4. Use data <- read.table("data_with_means.txt") command in RStudio to read the file.
5. Use data followed by brackets and column, row numbers to display the data.
