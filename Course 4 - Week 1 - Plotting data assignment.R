

## Download & unzip the file with the datasets
if(!file.exists("./Human Activity Recog w Smartphone dataset")){dir.create("./Human Activity Recog w Smartphone dataset")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./Human Activity Recog w Smartphone dataset/Dataset.zip")
unzip(zipfile = "./Human Activity Recog w Smartphone dataset/Dataset.zip", exdir = "./Human Activity Recog w Smartphone dataset")

