
library(files)

########################################################
# Sample texts from the first certain amount of lines
# from a text file, return an array.
#
# e.g.
# filepath <- "D:/R/data/capstone/en_US/en_US.twitter.txt"
# arr <- sampleText(filepath, 10, 0.5)
# arr[1]
########################################################
sampleText = function(filepath, lines, prob){
  con <- file(filepath, "r")
  vec <- readLines(con, lines)
  close(con)
  index <- rbinom(lines, 1, prob)
  vec2 = c()
  for (line in 1:lines){
    if (index[line] == 1){
      vec2 <- c(vec2, vec[line])
    }
  }
  return(array(vec2))
}