<h1>Code Book</h1>

<h3>Data source used</h3>
<a href="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" target="_blank">https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip</a>

<h3>Objectives</h3>
<ol>
<li>Merges the training and the test sets to create one data set.</li>
<li>Extracts only the measurements on the mean and standard deviation for each measurement.</li>
<li>Uses descriptive activity names to name the activities in the data set appropriately labels the data set with descriptive variable names.</li>
<li>From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.</li>
</ol>

<h3>Project contents</h3>
<ul><li>codebook.md</li>
<li>README.md</li>
<li>run_analysis.R</li>
</ul>

<h3>Activity Labels</h3>

<ul><li>WALKING</li>
<li>WALKING_UPSTAIRS</li>
<li>WALKING_DOWNSTAIRS</li>
<li>SITTING</li>
<li>STANDING</li>
<li>LAYING</li></ul>
<h3>Variables used:</h3>
  
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
  <h3>Code explanation</h3>
  <p>
   First i check if the dowload has been done. If not, i download the data and unzip it.
  Then I build paths for the original datasets, I load it and merge both training and test.
  </p>
  <p>
  One time this is done, is time for the headers and select which are the data of interest (the data that contains the words 'std' and 'mean'). Also the heders must be merged and the data must be limited to these headers, the rest is descarted.
  </p>
  <p>
  After I load the activities files (again test and training). The activities and the headers have or not names onoly numbers or not good readable names. The next step is solve this with replacements. In the activity_labels.txt file we have the activity number to name traduction.
  </p>
  <p>
  In the last step we create a new dataset based on the last dataset created in the other steps. These new dataset contains with the average of each variable for each activity and each subject. Finally when it's done we save the new dataset in a file called TIDY.csv.
  </p>
