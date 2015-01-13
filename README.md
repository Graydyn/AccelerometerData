# AccelerometerData

All variables are read in using read.csv()

The labels for variables and activities are also loaded using read.csv()

The training and test sets are merged together, and the labels are applied by assigning values to names()

grep is used to determine if fields contain the words mean or std, and then those variables are assigned to a new dataframe

A tidy data set with the average of each variable for each activity and each subject is then calculated using 
aggregate() and outputted to a csv with write.table()
