
library(stringr)
library(tm)
library(ggplot2)
library(ngram)

# constants
co_twitter_en = "../data/capstone/en_US/en_US.twitter.txt"
co_blogs_en = "../data/capstone/en_US/en_US.blogs.txt"
co_news_en = "../data/capstone/en_US/en_US.news.txt"

co_text_attr_en = "../data/capstone/text_attr_en.rds"

co_tidy_twitter_en = "../data/capstone/tidy_twitter_en.rds"
co_tidy_nostop_twitter_en = "../data/capstone/tidy_nostop_twitter_en.rds"
co_tidy_blogs_en = "../data/capstone/tidy_blogs_en.rds"
co_tidy_news_en = "../data/capstone/tidy_news_en.rds"

co_3gram_en = "../data/capstone/3gram_en.rds"
co_1gram_twitter_en = "../data/capstone/1gram_twitter_en.rds"
co_2gram_twitter_en = "../data/capstone/2gram_twitter_en.rds"
co_3gram_twitter_en = "../data/capstone/3gram_twitter_en.rds"
co_1gram_nostop_twitter_en = "../data/capstone/1gram_nostop_twitter_en.rds"
co_2gram_nostop_twitter_en = "../data/capstone/2gram_nostop_twitter_en.rds"
co_3gram_nostop_twitter_en = "../data/capstone/3gram_nostop_twitter_en.rds"

tidyText <- function(file, tidyfile) {
  con <- file(file, open="r")
  lines <- readLines(con)
  close(con)

  lines <- tolower(lines)
  # split at all ".", "," and etc.
  lines <- unlist(strsplit(lines, "[.,:;!?(){}<>]+")) # 5398319 lines
  
  # replace all non-alphanumeric characters with a space at the beginning/end of a word.
  lines <- gsub("^[^a-z0-9]+|[^a-z0-9]+$", " ", lines) # at the begining/end of a line
  lines <- gsub("[^a-z0-9]+\\s", " ", lines) # before space
  lines <- gsub("\\s[^a-z0-9]+", " ", lines) # after space
  lines <- gsub("\\s+", " ", lines) # remove mutiple spaces
  lines <- str_trim(lines) # remove spaces at the beginning/end of the line
  
  saveRDS(lines, file=tidyfile) 
}

tidyText(co_news_en, co_tidy_news_en)
tidyText(co_blogs_en, co_tidy_blogs_en)

df_news <- readRDS(co_tidy_news_en)
df_blogs <- readRDS(co_tidy_blogs_en)
df_twitter <- readRDS(co_tidy_twitter_en)
lines <- c(df_news, df_blogs, df_twitter)
rm(df_news, df_blogs, df_twitter)

# remove lines that contain less than 3 words, or ngram() would throw errors.
lines <- lines[str_count(lines, "\\s+")>1] # reduce 10483160 elements to 7730009 elements
trigram <- ngram(lines, n=3) # this line took long time
rm(lines)
df <- get.phrasetable(trigram) # this line took long time
rm(trigram)
saveRDS(df, co_3gram_en)

df <- readRDS(co_3gram_en)
