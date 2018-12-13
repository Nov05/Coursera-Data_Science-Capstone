
## Put your R Package on Github
## http://kbroman.org/pkg_primer/pages/github.html
## https://www.coursera.org/learn/data-science-project/supplement/IbTUL/task-1-getting-and-cleaning-the-data

## Load the data in
filepath <- "D:/R/data/capstone/en_US/en_US.twitter.txt"
con <- file(path, "r") 
vec <- readLines(con, 10) ## Read the first 10 lines of text 
readLines(con, 1) ## Read the next line of text 
readLines(con, 5) ## Read in the next 5 lines of text 
close(con) ## It's important to close the connection when you are done

## Sampling
filepath <- "D:/R/data/capstone/en_US/en_US.twitter.txt"
arr <- sampleText(filepath, 10, 0.5)
arr[1]

# Count lines
filepath <- "D:/R/data/capstone/en_US/en_US.twitter.txt"
con <- file(filepath) 
length(readLines(con))
close(con)
# [1] 2360148



# Find the longest line contains how many characters
filepath <- "D:/R/data/capstone/en_US/en_US.twitter.txt"
con <- file(filepath) 
lines <- readLines(con)
nchars <- lapply(lines, nchar)
maxchars <- max(unlist(nchars))
nwords <- sum(sapply(strsplit(lines, "\\s+"), length))
close(con)




# Test grepl()
text <- 'I love it.'
grepl('love')

# Match the lines that contain "biostats".
filepath <- "D:/R/data/capstone/en_US/en_US.twitter.txt"
con <- file(filepath) 
lines <- readLines(con)
matches <- lapply(lines, function(line){grepl('biostats', line, ignore.case=FALSE)})
close(con)
result <- lines[unlist(matches)]; result
# [1] "i know how you feel.. i have biostats on tuesday and i have yet to study =/"






filepath <- "D:/R/data/capstone/en_US/en_US.twitter.txt"
con <- file(filepath) 
lines <- readLines(con)
matches <- lapply(lines, function(line){grepl('A computer once beat me at chess, but it was no match for me at kickboxing', line, ignore.case=FALSE)})
close(con)
result <- lines[unlist(matches)]; result; length(result)
