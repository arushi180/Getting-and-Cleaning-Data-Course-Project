Getting-and-Cleaning-Data-Course-Project
========================================
I submitted run_analysis.R, which performs cleaning, and aggregation. It outputs one data set "data", which consists of 180 rows and 563 columns.
Performed the below:
-Read the data provided in all files.
-Performed rbind on X_train and X_test.
-Set names of columns.
-Used grep to Subset data to include columns with mean or std in their names.
-Matched activity names to their corresponding numbers and added them to the data.
-Added subjectData to the data set.
-Created another data set without subsetting on columns.
-Calculated mean of each variable.
-Saved data set generated.
