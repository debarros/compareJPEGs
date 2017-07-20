# When you have a whole bunch of files that may be duplicates, check them

library(jpeg)
setwd("C:/Photos") #enter the directory with the photos

files = list.files() # get a list of files

# find all the files that might be copies
copies = grep(pattern = "Copy of ", x = files, ignore.case = T, value = F) 
copynames = files[copies] #get their names
copynames = copynames[-169] # ignore any that are not jpeg files
originalnames = substr(copynames, 9, nchar(copynames)) # construct the original file names

file.exists(originalnames) # check whether the original files exist
copynames[!(file.exists(originalnames))] # print the names of the original files that are missing

# Read through the files and compare the copy to the original
# This will print the filenames of the copies that are different from the originals
for(i in 1:length(copynames)){
  print(i)
  x = readJPEG(originalnames[i], native = T)
  y = readJPEG(copynames[i], native = T)
  if(!(identical(x, y))){
    print(paste0("keep   ", copynames[i]))
  }
}


