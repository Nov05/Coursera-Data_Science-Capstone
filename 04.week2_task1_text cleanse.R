
library(stringr)

filepath <- "D:/R/data/capstone/en_US/en_US.twitter.txt"
con <- file(filepath) 
lines <- readLines(con)
close(con)

lines <- str_trim(lines)
lines <- tolower(lines)
# replace all "." and "," with space
lines <- gsub("\\.+|,+", " ", lines)
lines[80:100]

# split words by space
words <- unlist(strsplit(lines, "\\s+"))
# remove all non-alphanumeric characters at the beginning and the end of a word
words <- gsub("^[^[:alnum:]]+|[^[:alnum:]]+$", "", words)
length(words)

words.freq <- table(words)
dim(words.freq)
df <- cbind.data.frame(names(words.freq), as.integer(words.freq))
names(df) <- c('word', 'freq')
head(df)
tail(df)
# locate "i'm" 
df[which(df$word=="i'm"),]

# drop the first row cause the word is "blank".
df <- df[-1,]

# sort words by frequence descending
df <- df[order(-df$freq),]
head(df, 20)

# save data to RDS file
saveRDS(df, file = "D:/R/capstone/data/word_freq_twitter_en.rds")


