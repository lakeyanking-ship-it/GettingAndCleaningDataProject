## ------------------------------------------------------------
## 1. Load and merge the training and test datasets
## ------------------------------------------------------------

# Read metadata
features <- read.table("UCI HAR Dataset/features.txt")
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")

# Read training data
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

# Read test data
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

# Merge rows for training and test sets
X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)
Subject <- rbind(subject_train, subject_test)

# Apply column names
colnames(X) <- features$V2
colnames(Y) <- "Activity"
colnames(Subject) <- "Subject"

# Combine into one dataset
merged <- cbind(Subject, Y, X)

## ------------------------------------------------------------
## 2. Extract only mean() and std() measurements
## ------------------------------------------------------------

# Identify columns containing mean() or std()
selected_columns <- grep("mean\\(\\)|std\\(\\)", features$V2)

# Keep Subject, Activity, and selected measurement columns
tidy_subset <- merged[, c(1, 2, selected_columns + 2)]

## ------------------------------------------------------------
## 3. Use descriptive activity names
## ------------------------------------------------------------

tidy_subset$Activity <- factor(
  tidy_subset$Activity,
  levels = activity_labels$V1,
  labels = activity_labels$V2
)

## ------------------------------------------------------------
## 4. Label dataset with descriptive variable names
## ------------------------------------------------------------

names(tidy_subset) <- gsub("^t", "Time", names(tidy_subset))
names(tidy_subset) <- gsub("^f", "Frequency", names(tidy_subset))
names(tidy_subset) <- gsub("Acc", "Accelerometer", names(tidy_subset))
names(tidy_subset) <- gsub("Gyro", "Gyroscope", names(tidy_subset))
names(tidy_subset) <- gsub("Mag", "Magnitude", names(tidy_subset))
names(tidy_subset) <- gsub("BodyBody", "Body", names(tidy_subset))

## ------------------------------------------------------------
## 5. Create final tidy dataset with averages
## ------------------------------------------------------------

library(dplyr)

final_tidy <- tidy_subset %>%
  group_by(Subject, Activity) %>%
  summarise_all(mean)

# Write output file
write.table(final_tidy, "tidy_dataset.txt", row.names = FALSE)
