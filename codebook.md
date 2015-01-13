# CodeBook

For information on the original features of this dataset please set feature_info.txt

##Variables Created
train - created by merging:
							/train/subject_train.txt
							/train/X_train.txt
							/train/Y_train.txt

test - created by merging:
							/test/subject_test.txt
							/test/X_test.txt
							/test/Y_test.txt

trainAndTest - created by merging train and test

justMeansAndSTD - Created by excluding all variables without the words "mean" or "std" in them from trainAndTest.

##Summaries Created
tidy - Created by aggregating the mean of trainAndTest over Subject and Activity

##Transformations
Variable labels have been added to trainAndTest as supplied by features.txt
Activities have been labeled using the values provided by activity_labels.txt

##Units
All units are consistent with the original data and can be read from feature_info.txt
Angular velocities are in radians/second.  Times are in seconds.