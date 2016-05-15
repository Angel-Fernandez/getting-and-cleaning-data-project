# getting-and-cleaning-data-project
Coursera getting and cleaning data project

In this final project our pourpose is create a report via a information downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

We have done some tasks like:

1. Merges the training and the test sets and create only one.
2. Extracts part of the dataset.
3. Change the activity numbers with its descriptive tags.
4. Also change the data labels in order to clarify its meaning.
5. Create a new dataset using factors like the activities and compute the average of each variable. 


Variables used:
  
  <ul>
  <li>local_path --> for the original dataset</li>
  <li>data_set_folder --> used as base for the other paths as resource base</li>
  <li>test --> path for test data</li>
  <li>train --> path for training data</li>
  <li>data_test --> loaded test data</li>
  <li>data_train --> loaded training data</li>
  <li>merged_data --> contains merged training and test data</li>
  <li>headers --> path for headers and will be reused to contain the used headers</li>
  <li>merged_data --> contains only the data related to the colums selected</li>
  <li>data_test_ac --> contains test activities</li>
  <li>data_train_ac --> contains training activities</li>
  <li>cool_labels --> contins the labels for the activities</li>
  <li>merged_activities --> contains the union of data_test_ac and data_train_ac</li>
  <li>subjects_test_path --> contains test subjects</li>
  <li>subjects_train_path --> contains training activities</li>
  <li>merged_subjects --> contains the training and test subjects combination</li>
  <li>final_data --> is the subjects, activities and data of interest in the same data frame </li>
  <li>final_data$Activity <- activity factor </li>
  <li>final_data$Subject_ID --> subject factor</li>
  <li>data_melted --> data melted for the report</li>
  <li>report --> contains the dataset using the factors and the average of each variable. </li>
  </ul>
