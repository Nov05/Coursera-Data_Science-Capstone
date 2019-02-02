
# Get 1-gram

library(stringr)
library(tm)
library(ggplot2)
library(ngram)

## constants
# original texts
co_twitter_en = "../data/capstone/en_US/en_US.twitter.txt"
co_blogs_en = "../data/capstone/en_US/en_US.blogs.txt"
co_news_en = "../data/capstone/en_US/en_US.news.txt"
# cleaned texts
co_tidy_twitter_en = "../data/capstone/tidy_twitter_en.rds"
co_tidy_blogs_en = "../data/capstone/tidy_blogs_en.rds"
co_tidy_news_en = "../data/capstone/tidy_news_en.rds"
# n-grams
co_1gram_en = "../data/capstone/1gram_en.rds"
co_1gram_90_en = "../data/capstone/1gram_90_en.rds"
co_1gram_nostop_90_en = "../data/capstone/1gram_nostop_90_en.rds"
co_3gram_en = "../data/capstone/3gram_en.rds"
co_3gram_notail_en = "../data/capstone/3gram_notail_en.rds"

# merge texts
df_news <- readRDS(co_tidy_news_en) # 340061 lines
df_blogs <- readRDS(co_tidy_blogs_en) # 4532671 lines
df_twitter <- readRDS(co_tidy_twitter_en) # 5030042 lines
lines <- c(df_news, df_blogs, df_twitter)
rm(df_news, df_blogs, df_twitter)

head(lines, 30)

# get 1-gram
# split words by space
words <- unlist(strsplit(lines, "\\s+")); rm(lines)
# count word frequence
word.freq <- table(words)
# convert to data frame
df <- cbind.data.frame(names(word.freq), as.integer(word.freq))
rm(words, word.freq)
names(df) <- c('ngrams', 'freq')
row.names(df) <- df[,1]
# sort words by frequence descending
df <- df[order(-df$freq),]
# save as RDS file
saveRDS(df, file=co_1gram_en) # 6287 KB

# get 90% coverage (with stop words)
df$count <- 1
df$count <- cumsum(df$count)
df$coverage <- cumsum(df$freq) / sum(df$freq) * 100
df$prop <- df$freq / sum(df$freq)
df_90 <- df[df$coverage <= 91,]
df_90 <- subset(df_90, select=-c(count, coverage))
saveRDS(df_90, co_1gram_90_en)

# get 90% coverage (without stop words)
idx <- unlist(lapply(stopwords("en"), function(stopword){return(which(df$word == stopword))}))
df_nostop <- df[-idx,]; rm(idx)
df_nostop$count <- cumsum(df_nostop$count)
df_nostop$coverage <- cumsum(df_nostop$freq) / sum(df_nostop$freq) * 100
df_nostop$prop <- df_nostop$freq / sum(df_nostop$freq)
df_nostop_90 <- df_nostop[df_nostop$coverage <= 91,]
df_nostop_90 <- subset(df_nostop_90, select=-c(count, coverage))
saveRDS(df_nostop_90, co_1gram_nostop_90_en)

