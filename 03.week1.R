
# Week 1

folder <- 'D:/R/data/capstone/en_US/'
filelist <- list.files(path=folder)

l <- lapply(paste0(folder, filelist), function(filepath) {
  size <- file.info(filepath)[1]/1024/1000
  con <- file(filepath, open="r")
  lines <- readLines(con)
  nchars <- lapply(lines, nchar)
  maxchars <- max(unlist(nchars))
  nwords <- sum(sapply(strsplit(lines, "\\s+"), length))
  close(con)
  return(c(filepath, format(round(size, 2), nsmall=2), length(lines), maxchars, nwords))
})

df <- data.frame(matrix(unlist(l), nrow=3, byrow=TRUE))
names(df) <- c('file name', 'size(MB)', 'entries', 'longest line', 'total words')






# Count the lines that contain "love".
filepath <- "D:/R/data/capstone/en_US/en_US.twitter.txt"
con <- file(filepath) 
lines <- readLines(con)
loves <- lapply(lines, function(line){grepl('love', line, ignore.case=FALSE)})
hates <- lapply(lines, function(line){grepl('hate', line, ignore.case=FALSE)})
close(con)
loves <- sum(unlist(loves))
hates <- sum(unlist(hates))
loves; hates; loves/hates



# Match the lines that contain "biostats".
filepath <- "D:/R/data/capstone/en_US/en_US.twitter.txt"
con <- file(filepath) 
lines <- readLines(con)
matches <- lapply(lines, function(line){grepl('biostats', line, ignore.case=FALSE)})
close(con)
result <- lines[unlist(matches)]; result
# [1] "i know how you feel.. i have biostats on tuesday and i have yet to study =/"






