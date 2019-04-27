
rm(list = ls())

################################################
# count of all word occurrences (68064165)
sum(unigram$freq)
# count of different words (537782)
dim(unigram)[1]
co_words = "../data/capstone/1gram_en.rds"
unigram <- readRDS(co_words)

################################################
co_3gram = "../data/capstone/3gram_notail_en.rds"
trigram <- readRDS(co_3gram)

co_1gram_90 = "../data/capstone/1gram_90_en.rds"
unigram_90 <- readRDS(co_1gram_90)

head(unigram_90)
tail(unigram_90)
dim(unigram_90) #[1] 7362    5

f <- function(ngram){
  words <- strsplit(ngram, " ")
  words <- unlist(words)
  idx <- is.na(unigram_90[words[1],1])}

# test function
indices <- lapply(head(trigram[,1]), f); indices

# apply function to rows
indices <- lapply(trigram[,1], f)
indices <- unlist(indices)
head(indices)
tail(indices)
sum(indices) #197399

trigram$delete <- indices
sum(trigram$"delete")
dim(trigram)[1] #4060396

# whether these 3-grams should be deleted
sum(indices)/dim(trigram)[1] #0.0486157

# If only save two columns, the RDS file is only 81 KB in size. 
df <- trigram[,c('freq', 'prob')] 
saveRDS(df, "test.rds") #81 KB
row.names(df) <- trigram$ngrams 
saveRDS(df, "test.rds") #33 MB

df <- trigram[,c('ngrams', 'freq', 'prob')] 
saveRDS(df, "test.rds") #33 MB

df <- trigram[,c('ngrams', 'prob')] 
saveRDS(df, "test.rds") #33 MB

start.time <- Sys.time()
head(df[grep("^xoxo", df[,'ngrams']),])
end.time <- Sys.time()
end.time - start.time #Time difference of 0.6528349 secs

start.time <- Sys.time()
head(trigram[grep("^xoxo", trigram[,'ngrams']),])
end.time <- Sys.time()
end.time - start.time #0.6409659 secs

start.time <- Sys.time()
r <- head(trigram[grep("^h", trigram[,'ngrams']),])
end.time <- Sys.time()
end.time - start.time #0.8464189 secs

start.time <- Sys.time()
r <- trigram[grep("^h", trigram[,'ngrams']),]
end.time <- Sys.time()
end.time - start.time #Time difference of 1.187966 secs














