
unigram <- readRDS("d:/r/data/capstone/1gram_en.rds")
df <- readRDS("d:/r/data/capstone/3gram_notail_en.rds")

# there are 4,060,396 entries

f <- function(ngram){
       words <- strsplit(ngram, " ")
       words <- unlist(words)
       return(words[1])}

# test function
head(df$ngrams)
firstwords <- lapply(head(df$ngrams), f)
firstwords <- unlist(firstwords); firstwords

# Apply function to 3-gram
firstwords <- lapply(df$ngrams, f)
firstwords <- unlist(firstwords) # 4,060,396 rows
head(firstwords, 10)

# count unique values
firstwords <- unique(firstwords)
length(firstwords) # 53766

53766/537782 # 0.09997731

# total word occurency
sum(unigram$freq) # 68064165

# 3-gram dict covered occurency
freqs <- lapply(firstwords, function(word){
  return(unigram[word, "freq"])
})
freqs <- unlist(freqs)
head(freqs)
sum(freqs) #66520911

66520911/68064165 # [1] 0.9773265

